---
layout: post
title: Again and Again and Again
---

# Again and Again and Again

Idempotence is an important concept used to build reliable software
systems. It means that an operation when done multiple times will get
the same result. If for some reason the first time I try it, it fails,
I can simply try again.

Suppose I use a blender to make smoothie, and I am interrupted by a
phone call. When I am back, I can simply turn the blender back on. It
doesn't matter whether the smoothie is unblended, half-blended, or
well-blended.

But if I am cooking, and I got interrupted. When I come back, I would
have to think whether I need to add salt. If I've done it, and I do it
again, my food would be too salty. Adding salt isn't idempotent.

For reliability, idempotence is crucial. A series of operations, if
all successful, would move the system to its goal. But any of those
could fail, and we can't know which ones. If all of these operations
are idempotent, recovering from failure is as simple as starting over,
and retrying everything.

We don't need to know the partial failure state the system is
in. That's a huge advantage.

\* \* \*

Idempotence is useful in mathematics and computer science. How about
in real life? What are some examples?


1.
 * He cheats on his girlfriend, and he's a cheater.
 * He cheats on his girlfriend, and he's still a cheater.

2.
 * I stab him in the back, and he's dead.
 * I stab him in the back, and he's still dead.

3. 
 * I paint the car black, and it's black.
 * I paint the car black, and it's still black.


These examples of "idempotence" depends on how the words are
used. They are all problematic. Can I kill a person who's already
dead? Surely the second time he cheats on his girlfriend he's going to
have a harder time asking for forgiveness (or maybe not?). And example
3 we are relying on some physical ideal of "blackness".

Another perplexing obstacle to idempotence is that mere repetition has
social significance. Saying "I am home" once adds to everyone's
knowledge that "I am home". If we are rational creatures, my saying "I
am home" a second time shouldn't add anything new. But if I do say
it a second time, of course everyone would notice the repetition, and
make a note that something more than "I am home" is going on. Maybe I
brought home cake.

Memory is the problem. In logic or in a computer, an operation erases
all past history. That's the fundamental reason how something can be
idempotent. But for any social transaction, somebody is going to
remember something, thus foiling idempotence.

A girl says yes to one guy. A girl says yes to another guy. She says
yes to a third guy. She says yes to a forth guy. We are going to think
she's a whore.

So in most human situations, "try again" doesn't work, for a very
fundamental reason: we remember.

If a system is memoryless, then "try again" becomes more effective. No
system is memoryless, but some approximates it. The larger a social
system is, the more it seems memoryless. Because the opportunities for
first contact becomes much much larger. You can try again and
again. Crucially, to try again on different people.

The job market approximates a memoryless system. Nobody knows what
jobs you apply for, or what your resume looks like, or who you say
you are, or how much money you want. Asking too much money in one job
does not affect the prospect of another.

That is an important lesson. Day to day, our social instinct is tuned
to a small tribe. Within the tribe everybody knows everybody, and
everybody remembers what happens. Social rejection is a *Real
Deal*. Failure is harder to recover from.

In the modern world though, the social sphere becomes larger than
anyone can keep in the head. The size of it affords an anonymity that
opens up strategies that wouldn't make sense on a smaller scale. It is
cheap to fail, because it's always easy to start over with a blank
slate.

Spamming works. It's hard to fool the same person twice with the same
scam, but quantity of people who would fall for the first time would
still make the old scam worthwhile.

So if it fails, don't give up. Try again on somebody else.