---
layout: post
title: Second Degree Homoiconicity
---

Is [ComaLisp](http://metacircus.com/hacking/2011/09/07/lispy-abuse-of-ruby-syntax.html) homoiconic?

I wish it is, so I did some research to see if I can argue that it is. (If I can
argue that it is already homoiconic, then I don't have to work to make it so).

The origin of the term is from [TRAC](http://en.wikipedia.org/wiki/Homoiconicity),

> Because TRAC procedures and text have the same representation inside and outside the processor, the term homoiconic is applicable, from homo meaning the same, and icon meaning representation.

By this definition, ComaLisp is not homoiconic, because the Ruby interpreter
executes AST, not the source text. However, with some work, ComaLisp could be
second degree homoiconic.

There is the gem [LiveAst](http://liveast.rubyforge.org/). It can turn a method or block into AST. It also adds Kernel#ast_eval. With LiveAst, we can achieve 2nd-degree homoiconicity in Ruby,

Text => AST => Interpreter => AST => Text

Whereas a conventional Lisp would be 1st-degree homoiconic, i.e.,

AST => Interpreter => AST

## Is Thinking Homoiconic?

If the "stuff" of thought is the same as thought itself, then it is 1st-degree
homoiconic. But if language is an intermediary of thought, and thought itself is
a meta-language (see
[Jackendoff](http://www.amazon.com/Foundations-Language-Meaning-Grammar-Evolution/dp/0199264376/ref=sr_1_2?ie=UTF8&qid=1315366216&sr=8-2)),
then the it is 2nd-degree homoiconic.

Discuss on [Hacker News](http://news.ycombinator.com/item?id=2968276).
