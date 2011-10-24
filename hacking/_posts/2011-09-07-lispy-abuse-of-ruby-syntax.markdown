---
title: A Lispy Abuse of Ruby
layout: post
---

I wrote a dialect of Lisp in Ruby. I call it ComaLisp. It looks like,

    (ComaLisp {
       (let [:a,1], [:b, 2] {
          (defun [:foo,:a,:b,:c] {
             (let [:d, 6] {
                (list a, b, c, d)})})
          (list a, b, (foo 3, 4, 5))})})

This is __VALID__ Ruby syntax under 1.9! I kid you not.

## I have a confession to make

![I Love Parens](http://p.twimg.com/AYrd9DACAAIBr7F.png)

I love Lisp's syntax. Or rather, the lack thereof. But people might not like
such austere minimalism. So ComaLisp has braces and curlies, and a liberal
sprinkling of commas. It is a delicious syntatic soup fortified with extra
punctuation marks. Yum.

## Install ComaLisp

    gem install comalisp

Then in the IRB

    require 'comalisp'
    (ComaLisp {
       (puts "hello world")
      })
    # "hello world"

Voila!

## Introduction To ComaLisp: List Algebra

For the following examples, we assume that the code is run in the ComaLisp
DSL context:

    (ComaLisp {
       ... code here ...
      })

In ComaLisp, lists and conses are simply represented by array.

    (list 1, 2, 3) # => [1,2,3]

However, the fact that lists are represented by arrays is an implementation
detail. You can't rely on that. You should consider whatever returned by `list`
as an abstract datatype, and only use the provided functions in ComaLisp to
operate on lists. (More pain the better, right?)

The good old `car` and `cdr` work as you'd expect.

    (car (list 1, 2, 3)) == 1
    (cdr (list 1, 2, 3)) == (list 2, 3) == [2,3]

We can add a new element onto the list by using `cons`.

    (cons 1, (list 2, 3)) == (list 1, 2, 3) == [1,2,3]

Now, the perennial question when designing a Lisp dialect, what is the empty
list? I decided to use `[]` as the empty list, not nil. This way the list/cons
algebra works out.

    # the empty list is []
    (list) == []
    # the empty list is a fixpoint for car
    (car (list)) == (car (car (list))) == ... == []
    # the empty list is a fixpoint for cdr
    (cdr (list)) == (cdr (cdr (list))) == ... == []

However, because the list is represented by an array, it's not possible to have
an improper list like in a real Lisp.

    (cons 1 2) => '(1 . 2) # not possible

In ComaLisp, the second argument to cons _must_ be a list

    (cons 1, (list))

## Declare Local Variables

Although ComaLisp is 100% compatible with Ruby, and you can use local variables
just as in Ruby, that would be cheating. Use `let` to declare variables in
ComaLisp!

    (let [:a,1],[:b,2] {
      (list a,b)}) == (list 1, 2)

Each let defines a new scope. You can shadow variables with nested lets.

    (let [:a,1], [:b,2] {
      (let [:a,3] {
         (list a, b)
       })}) == (list 3, 2)

## Define Function

Here's how you define a function in ComaLisp

    (ComaLisp {
      (defun [:foo,:a,:b] {
         (list a, b)})
      (foo 1, 2)}) == (list 1, 2)

## Invoking Function

ComaLisp, being a functional language, allows you to apply functions
dynamically.

    # call
    (ComaLisp {
      (defun [:foo,:a,:b] {
         (list a, b)})
      (call :foo, 1, 2)}) == (list 1, 2)
      
    # apply
    (ComaLisp {
      (defun [:foo,:a,:b] {
         (list a, b)})
      (apply :foo, [1, 2])}) == (list 1, 2)

## OOP Integration With Ruby

The best that ComaLisp has to offer is probably its tight integration with
Ruby's powerful object system. If you have a native Ruby object, you can invoke
its methods the Lisp way,

    (map [-1,-2,-3] { |e|
      (abs e)}) == [1,2,3]

## What To Hack On

If you find this interesting, feel free to fork [ComaLisp](https://github.com/hayeah/ComaLisp). Two things you can hack on:

1. Use method_missing to generate cadr, caar, cdar, cadr, etc.
2. ComaLisp lacks a macro system.
3. A REPL for ComaLisp
4. Port ComaLisp to JRuby, Rubinius, etc.

What crazy ideas do you have for ComaLisp? [Discuss on Hacker News](http://news.ycombinator.com/item?id=2966859).