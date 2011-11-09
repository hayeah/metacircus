---
layout: post
title: How Google Ad Ranking Maximizes Profit
---

Greed, as they say on Wall Street, is good. And that, for Google, is in fact
_mathematically true_.

I was reading [Brad Geddes](http://certifiedknowledge.org/blog/)'s book [Advanced Google AdWords](http://www.amazon.com/gp/product/0470500239/ref=as_li_ss_tl?ie=UTF8&tag=metacircus-20&linkCode=as2&camp=217145&creative=399369&creativeASIN=0470500239),
to learn how to use AdWords. Naively (like me), you might think at first
that it would make sense to put the highest bidder first. But no. Google
ranks ads by CTR (click-through rate) * max CPC (cost per cick).

Why? _Because doing that maximizes profit._

It makes sense if you think about it. If somebody is paying $100 per click for
an ad, but doesn't get any click, then Google makes nothing. But it wasn't clear
to me whether this ranking strategy is indeed _THE_ mathematically optimal
strategy.

I am a nerd. So I couldn't just let that slide by.

I had to prove it.

# Sanity Check

So we want to prove that ranking by CTR * CPC maximizes profit. Before setting
out to prove it, I did a quick sanity check so I wouldn't go on a wild goose
chase. Suppose there are two ads.

+ Zoloft. CTR = 50%. CPC = $10
+ Prozac. CTR = 100%. CPC = $5

If there are 100 searches for anti-depressants, 50 would click on the Zoloft ad,
and Google makes $500. Given the same 100 searches, 100 would click on the
Prozac ad, and Google makes $500.

It's a toss-up. If you randomly distribute traffic between these two ads, Google
makes the same amount. There is no reason for Google to prefer one over the
other. Playing around with the CTR and CPC of the ads by adjusting them up and
down, it's clear that the formula works.

# The Proof

Given that there are n ads ranked in order of CTR_n * CPC_n. Assume as given
that the impressions received by these ads, N_n, is strictly decreasing (ad 1
is seen more than ad 2, and ad 2 is seen more than ad 3, etc...).

If this is not the optimal strategy, then there is an alternate ranking that
would yield higher earning. Earning from some ad of rank n is

E_n = N_n * CTR_n * CPC_n

Let's rewrite CTR_n * CPC_n as P_n. So earning for the n-th ad would be

E_n = N_n * P_n

For the said hypothesized alternate ranking, there should exist a pair of P_a
and P_b such that a outranks b, but if we switch them, the total earning would
increase. Or as an equation, there should be P_a, P_b (for a > b) such that,

(1) (N_a * P_b + N_b * P_a) > (N_a * P_a + N_b * P_b)

We want to show that this is impossible. By rearranging the terms,

(2) (N_a * P_b - N_b * P_b) > (N_a * P_a -  N_b * P_a)

Then factoring,

(3) P_b(N_a - N_b) > P_a(N_a - N_b)

Canceling, we get,

(4) P_b > P_a

Which violates the given that P_a > P_b for any a > b. So (1) cannot be true for
any pair of a,b. QED.

# When I Was 10, I Thought Girls Are Gross

I thought marketing is gross. I didn't think that I'd enjoy learning about
marketing. Why should I force somebody to buy my crap? Why should I become an
[expert pain in the ass](http://godaddy.com)?

Marketing, like everything else, can be a force of good or evil. You can trick
people into buying shit that doesn't work. Or you can build something awesome,
and tell people about it.

Google AdWords incentivize people to create relevant ads:

> By incorporating a combination of both bid prices and how many clicks those ads received, Google managed to maximize how much they made on any single search results page. This simple change also created an environment where a small company with a more compelling offer could have its ad displayed higher in a \[search result page\] than a large national company who did not take the time to create relevant ads. Price no longer trumped relevancy. Having the most money did not ensure the most clicks or visibility. Advertisers had to choose keywords that were more relevant to their products and create ads to match.
> Brad Geddes - _Advanced Google AdWords_

I think that's pretty cool.

[On Hacker News](http://news.ycombinator.com/item?id=3216234)