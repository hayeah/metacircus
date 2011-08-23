---
layout: post
title: PHP is Plenty Good
---

Many hackers I respect say how great Jon Bentley's [_Programming
Pearls_](http://www.amazon.com/Programming-Pearls-2nd-Jon-Bentley/dp/0201657880)
is. I finally bought my own copy, and it really is that good. I am
reading column 6, _Perspective on Performance_, which starts with a
case study about optimizing the n-body problem, done by Andrew
Appel. Initially, for n=10000, it would take a year, and at the end,
it took less than a day, more than 400x improvement. I was so struck
by the story, that I stopped reading, to quote the case in full:

* _Algorithms and Data Structures._ Appel's first priority was to find an efficient algorithm. He was able to reduce the O(n^2) cost per time step to O(n log n) by representing the physical objects as leaves in a binary tree; higher nodes represent clusters of objects. The force operating on a particular object can be approximated by the force exerted by the large clusters; Appel showed that this approximation does not bias the simulation. The tree has roughly log n levels, and the resulting O(n log n) algorithm is similar in spirit to the divide-and-conquer algorithm in Section 8.3. This change reduced the run time of the program by a factor of 12.

* _Algorithm Tuning._ The simple algorithm always uses small time steps to handle the rare case that two particles come close to one another. The tree data structure allows such pairs to be recognized and handled by a special function. That doubles the time step size and thereby halves the run time of the program.

* _Data Structure Reorganization._ The tree that represents the initial set of objects is quite poor at representing later sets. Reconfiguring the data structure at each time step costs a little time, but reduces the number of local calculations and thereby halves the total run time.

* _Code Tuning._ Due to additional numerical accuracy provided by the tree, 64-bit double-precision floating point numbers could be replaced by 32-bit single-precision numbers; that change halved the run time. Profiling the program showed that 98 percent of the run time was spent in one function; rewriting that code in assembly language increased its speed by a factor of 2.5.

* _Hardware._ After all the above changes, the program still required **two days of time on a departmental machine that cost a quarter of a million dollars**, and several runs of the program were desired. Appel therefore moved the program to a slightly more expensive machine equipped with a floating point accelerator, which halved its run time again.

End quote. **QUARTER OF A MILLION DOLLARS**! _1985 dollars_.  That is
amazing. The length to which Appel had gone for performance tuning had
*REAL* values, not just some idle academic challenge.

This case also reminds me to ask tough questions: what is it about
what I do, how I do it, that has _ramifications in reality_?. How much
value are my tests worth? How much value is my continuous integration
setup? Do I have an expectation of what and how much feature X would
give me, so at least I know if I had fallen short of that expectation.

There are metrics that clearly matters. How much profit am I making?
How fast is my audience growing? These are fine, hard facts. But I
don't even know where to begin to find out if the "intangibles" matter
at all. How do I even know that my code is "maintainable"? What does
it mean for my code to be "well tested"? I certainly have a sense of
Beauty (without the scare-quotes), but again, can I afford Beauty?

Lacking any good evidence, perhaps all we have to go on is common
sense. Beyond a certain point, whatever practice that we adopt can
become a fetish. Does 100% test coverage matter? Most likely not. If
absolute reliability is crucial, say nuclear reactor control, you
don't get reliability out of test coverage anyway. Reliability comes
out of redundancy.

Some testing is surely good, so my common sense (qua experience) tells
me, but when does it become a fetish? Does code metric matter? My
common sense (qua maybe prejudice) says it's bullshit.

For everything, there's a point of diminishing return. Extreme
programming's motto is that if X is good, then more X the
better. Testing is good, so test always. Which is obviously insane,
but probably said to be provocative. Individually we have to decide
when good enough is enough. Sometimes good is more than enough, so a
waste of time.

And stepping out a bit, I have serious doubt that minute technical
decisions matter. Programming anxieties such as how we mock objects,
or if we are violating Single Responsibility Principle, or we have
hard couplings, or a class has too many dependencies, or we violate
the Law of Demeter... maybe none of it really matters.

What matters is to have your product out there for people to use. PHP
is plenty good, and Ruby (or your favourite toy) won't save you from
shit business idea.
