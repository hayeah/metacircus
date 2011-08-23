---
layout: post
title:  Exploring Ruby Internals with GDB and DTrace
---

# Don't Just Grope at The Elephant

It is always very hard to learn a large code base, especially
initially, when there's not even a vague idea of how things fit into a
structure. This overall picture of the code base is the crucial first
step. After that, it becomes much easier to see an arbitrary fragment
of code, and guess what it does.

It is this first step that's the hardest. It is a gestalt process,
where out of a sea of random information miraculously emerges
understanding. I would pretty much pick a place, and start to randomly
walk through the files, then hope for the best.

It's hard. But GDB and DTrace can help! (Though now you have three
problems instead of one.)

# What's Going On?

First, we need to figure out what's going on. The plan is to evaluate
a Ruby expression, and let DTrace tell us what are involved. Let's
just start the irb. We also want to know the pid of the irb, so DTrace
and GDB can get a handle of it.

    > irb
    > 1 + 1
    => 2 #win!
    > Process.pid
    => 31415 # or whatever.
    
Now, we'll write a DTrace script to peek into it,

    # function_calls.d
    pid31415:ruby:rb_*:entry {
      @obj[probefunc] = count();
    }

and run it in another terminal session,

    > sudo dtrace -s function_calls.d -p 31415
    dtrace: script 'object.d' matched 1175 probes
    # Go back to the irb and run stuff.
    # When you are happy, hit interrupt
    ^C
    
and get a dump of all the ruby functions being called while evaluating
the expression you typed into irb:

    ...
    rb_gc_force_recycle                                              76
    rb_ivar_get                                                     168
    rb_newobj                                                       199
    rb_call                                                         323
    rb_call0                                                        323
    rb_eval                                                         840

With this, we get a rough idea of what functions are important in the
interpreter. Right off the bat, you know `rb_eval` is central to the
interpreter. But `rb_gc_force_recycle`, what is that? Uh, NVM, let's
keep going. How do I find `rb_eval`?

Before you get greppy, let's go into GDB.

    > gdb ruby 31415
    (gdb) info func rb_eval
    All functions matching regular expression "rb_eval":
    File eval.c:
    VALUE rb_eval_cmd(VALUE, VALUE, int);
    VALUE rb_eval_string(const char *);
    VALUE rb_eval_string_protect(const char *, int *);
    VALUE rb_eval_string_wrap(const char *, int *);
    static VALUE rb_eval(VALUE, NODE *);
    (gdb)
    
Oh wow, and I know the type information too. And look, I also found
out about `rb_eval_string`. I guess it evals a string?

    (gdb) p rb_eval_string("false")
    $7 = 0  # uh, ok?
    (gdb) p rb_eval_string("true")
    $8 = 2  # hm, i guess it's a magic constant
    (gdb) p rb_eval_string("nil")
    $9 = 4  # another magic constant
    (gdb) p rb_eval_string("1")
    $10 = 3 # wtf?

Turns out that a Ruby `VALUE` is just a pointer type. If the least
significant bit is 1, then it's an integer, if it's 0, then it's a
ruby object. We shift right by one bit to get back the integer value.

    (gdb) p rb_eval_string("10")
    $13 = 21
    (gdb) p rb_eval_string("5+5") >> 1
    $17 = 10
    
Yup. And 0 is false, 2 is true, nil is 4. These are common values, so
it makes sense to use magic constants. In particular, false is 0,
because more than just a convention, that helps with CPU's speculative
execution (I guess?).

I am curious about arrays too. No problem! No need to ask GOD, ask GDB.

    (gdb) info func rb_array
    All functions matching regular expression "rb_array":
    (gdb) # oops. nothing? let me try again
    (gdb) info func rb_ary
    static VALUE rb_ary_transpose(VALUE);
    static VALUE rb_ary_uniq(VALUE);
    static VALUE rb_ary_uniq_bang(VALUE);
    static VALUE rb_ary_unshift_m(int, VALUE *, VALUE);
    static VALUE rb_ary_values_at(int, VALUE *, VALUE);
    static VALUE rb_ary_zip(int, VALUE *, VALUE);
    (gdb) # bingo!

I think it's pretty awesome that we can learn all this stuff without
even going into the source code. Maybe by know you want to see some
code?  Is it time now to download Ruby source, and fire up your
favourite editor? Maybe not.

    (gdb) list rb_eval
    2950
    2951    static VALUE
    2952    rb_eval(self, n)
    2953        VALUE self;
    2954        NODE *n;
    2955    {
    2956        NODE * volatile contnode = 0;
    2957        NODE * volatile node = n;
    2958        int state;
    2959        volatile VALUE result = Qnil;
    
Whoooo! I didn't even have to grep.
    
Arthur C. Clarke said that any sufficiently advanced technology is
indistinguishable from magic. Magic already took place some 25 years
ago! GDB is like IRB on steroid for the Ruby internals on a pony.

Now let's play around some more with DTrace! ...

But I am tired. I'll write about DTrace in a post.

