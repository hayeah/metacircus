---
layout: post
title: Playing Git Like A Violin
---

# Play Git Like A Violin

People think that playing the violin is hard. But
that's only when you are learning and
practicing. When you are *actually* playing, it's
as natural as breathing. So it is with Git. After
a couple years of use, and the help of a few
aliases, my git usage now comes as easily as music
from a familiar piece:

    git caa
    git ca
    git s
    git l
    git r1
    git rh 330183
    git s
    git d
    git cm 'a new commit'

All of us at one point or another kept a private
cheat sheet of common git commands. I know I
did. After a while, I gained enough experience
with Git to know the common tasks that I do all
the time. These common tasks I have created
aliases for.

Very often, after I've made a commit, I'd keep
wanting to make small fixes to it, like fussing
around with spaces, or renaming variables, or
rewording the comments, or minor refactoring of
the code. These changes are too small to worth
their own commits (that would only clutter up the
history). So I'd rather if these changes belong to
the commit I already have. I'd do:

    git commit -a --amend -C HEAD

This adds all the changes to the staging area, and
commit it as an amendment to the previous commit,
using the same commit message. Effectively, I am
saying: "put whatever I've done into the previous
commit."

For this usage pattern, I have created an alias in
my `~/.gitconfig`, like so:

    [alias]
      caa = commit -a --amend -C HEAD

Then ever after, I'd type `git caa` whenever I
wanted to do the same thing. Another pattern I use
a lot is to create a commit for the changes I've
done, all in one step:

    git commit -a -m 'commit message'

This I'd create another alias:

    [alias]
      cma = commit -a -m

Then ever after, I'd type `g cma`. 90% of the
time, `git caa` and `git cma` cover my commit
needs. If you ask me what they stand for, I
honestly can't tell you, because these commands
are so short, they are ingrained in my muscle
memory. I don't think about what I am doing with
Git, just as when I am playing an arpegio on the
violin, I don't think about the notes
individually.

Here are all my git aliases. I hope you find some
of them useful to integrate into your Git
workflow.

    [alias]
      # I like using the interactive mode to make complex commits
      ai = add --interactive

      # All the aliases relate to commits. Note that
      # they are grouped by common prefixes, so I don't
      # confuse what I want done by accident.
      c = commit
      # commit with a message
      cm = commit -m
      cma = commit -a -m
      # amending the previous commit
      ca = commit --amend
      caa = commit -a --amend -C HEAD

      # reset
      ## soft resets
      r = reset
      r1 = reset HEAD^
      r2 = reset HEAD^^
      ## hard resets
      rh = reset --hard
      rh1 = reset HEAD^ --hard
      rh1 = reset HEAD^^ --hard

      # shortcuts for commands
      s = status
      d = diff
      a = add
      co = checkout
      b = branch
      l = log
      f = fetch
      r = reset
      p = push
      

Cherry on top: I aliased `g` as `git` in my bash
shell. What I actually do is:

    g caa
    g ca
    g s
    g l
    g r1
    g rh 330183
    g s
    g d
    g cm 'a new commit'
