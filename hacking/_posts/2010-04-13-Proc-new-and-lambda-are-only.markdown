---
layout: post
title:  Proc.new And Lambda Are Only 99.9% the Same
---

Proc.new And Lambda Are Only 99.9% the Same. Which is to say, not at
all the same. 99.9% of the time it's ok to use lambda, proc, and
Proc.new interchangeably. So I do (shame on me).

I prefer using lambda when I am doing functional style programming in
Ruby, passing around many closures, because the syntax is less chunky
than Proc.new. Trivial preference that shouldn't matter.

Except that it does. And it hurts a lot when it does.

Most of the time I get away with it... but Chinese has a lovely
saying, a moral admonition, that "the more you walk the dark road, the
more ghouls you _will_ see." So sooner or later I am bound to run into
an edge case that makes my code to behave in unexpected ways.

This kind of bugs are especially insidious, since I've been
conditioned (or, I've conditioned myself) to think that Proc.new and
Lambda are the same. On some level I know they are different, of
course, but I am so used to using them interchangeably, that there's a
lacuna in my vision that makes it hard to suspect the problem could
arise from using Lambda instead of Proc.new, or vice versa.

I had a recent bug that boils down to this:

    def test1
      yield([1,2])
    end

    def test2(&block)
      block.call([1,2])
    end

    pr = Proc.new { |(a,b)| [a,b] }
    fn = lambda { |(a,b)| [a,b] }
    p test1(&pr) # => [1,2]
    p test1(&fn) # => [1,2]
    p test2(&pr) # => [1,2]
    p test2(&fn) # => wrong number of arguments (1 for 2) (ArgumentError)

Why doesn't it work? It turns out that lambda is stricter than block
about the argument list. The arity for both `fn` and `pr` is actually
two. While a lambda complains, a Proc.new magically takes apart the
array argument.

The weird part is, `fn` and `pr` behave the same way if they are
`yield`ed to, but not when they are being `block.call`ed. Yay for
random Ruby esoteric trivia.

*Bonus round*. We know that the `return` keyword returns from lambda,
regardless of where lambda closure was created (unlike Proc.new, for
which `return` always return from the method context where the
Proc.new closure was created). But...

    def test1(&block)
      block.call
    end

    test1(&lambda { return }) # ok

    def test2
      yield
    end

    test2(&lambda { return }) # unexpected return (LocalJumpError)

In this case, the return preserves its semantic if called via
`block.call`, but not when `yield`ed, exactly the opposite as in the
previous case. Pretty weird huh? That'll be on Thursday's quiz.

Now, for a trick question.

    b = Proc.new { |(a,b)| [a,b] }
    b.call(1,2) # ok
    b.call(3,4) # fails

Why does it fail? Hint, it's fixed in Ruby1.9. And this bug I actually
ran into in production code. It was not as balatant as this example,
and involves indeterminism introduced by threads. So that was a lot of
fun in the painful sense of the word, in the butt.

The moral of the story is that the Python Zen, TOOWTDI (There's Only
One Way To Do It), is a sage advice. But Ruby isn't Python, as there
are many ways to chunkify a bacon. So the responsibility is on us
individually. If there's no compelling reason to use one approach over
the other, _always_ (\*) go with the same default.


(\*) Confession: for a while, I only used `if`, and never
`unless`. Srly. I've since given that up. This is a good example
of Poe's Law, "Without a winking smiley or other blatant display of
humor, it is impossible to create a parody of Fundamentalism that
SOMEONE won't mistake for the real thing."
