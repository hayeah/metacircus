---
layout: post
title: 6 Steps I Took From Idea To Launch
---

![wise old man](http://farm3.static.flickr.com/2768/4460525589_783067f199.jpg)

A visitor in New York City was asking an old man for direction, "excuse me, how
do I get to Carnegie Hall?" The old man, at once senile and wise, answered:

_Practice. Practice. Practice._

So it is with Lean Startup.

# Lean Kata

I thought that my ideas are so great, that I just need to code, put in some
metrics, add some A/B tests, then I'd be on my way to lean epiphanies and
success. Of course, it wasn't that easy.

I thought that the lean approach is just a bag of techniques and tricks that I
can pick and choose as I wish. I thought I could simply graft the lean
techniques onto what I already knew: coding.

I didn't take learning seriously. So up until now, I left behind a lot of
half-hatched ideas and dead code in my wake. I felt like a murderer of
ideas.

To benefit from lean thinking, I eventually realized, I had to step out of my
comfort zone with programming, and focus on the lean practice itself. That's why
I dececided to undertake a "Lean Kata". Like doing a Code Kata, I focused myself
on learning, rather than accomplishing. I am glad I went through it.

What follows is what I did to launch _FaceOff_, a [Chrome
extension to block "like" button](http://getFaceOff.com).

# 1. Idea

For the Lean Kata, I was against using one of my own <span style="text-decoration:line-through;">brilliant</span> retarded ideas.

I noticed on Hacker News [a blog post](http://www.jwz.org/blog/2011/09/surprise-facebook-doesnt-like-privacy-countermeasures/) about the Facebook like
button by Jamie Zawinski. The like button tracks you even if you don't click on
it. By merely visiting a page and loading the like button, Facebook knows that
you've been there. Facebook, in fact, knows more about you than your mom.

Personally I am not super paranoid about Facebook. But seeing the number of
upvotes on that post, I thought it was a safe bet.

The German tech site Heise linked to in Jaime Zawinsky's post already proposed a
[2-click like
button](http://www.heise.de/ct/artikel/2-Klicks-fuer-mehr-Datenschutz-1333879.html)
that seemed pretty compelling. So I thought I could make a Chrome extension that
implements it.

At this point, I knew that people are paranoid about Facebook. But there already
exists a Chrome extension that blocks Facebook outright. I didn't know if people
would want a Chrome extension specifically for the 2-click like button.

# 2. MVP

It was 2am in the morning, and I was going to bed. But I thought, oh what the
heck, let me quickly create a mock and put it up somewhere.

I decided to take a more paranoia mongering approach. It is easier to pin the
fear to a person, than the abstract idea of privacy. So I thought I'd model the
marketing message after 1984's "Big Brother Is Watching", and villanize
Mark Zuckerberg, probably somewhat unfairly. Furthermore, it would enhance the
villainy by adding a profit motive. Nobody wants to know that Facebook is going
to make a cool $1B by sacraficing our culture's collective privacy.

I made the mocks with Balsamiq and pushed it on Github. It looks like this:

![FaceOff Mock](https://a248.e.akamai.net/assets.github.com/img/bba1be44947273f17155badbc42dd70ba7d0829c/687474703a2f2f6870686f746f732d617368342e666263646e2e6e65742f3333383236315f3235343737313237373838373835355f3130303030303634393533343939365f3835313136345f383036363230365f6f2e6a7067)

I added a clear call to action in the README: "watch this repository if you are
interested". At this point I had _0 lines of code_.

The next day there were 50 watchers on the repo. I was satisfied that there was
interest for this project.

# 3. Coding

I spent the next day coding. The prototype was done that afternoon. It could
block like buttons embedded by an iframe, but not those using the Facebook
Markup Language (FBML). I spent an extra day fixing that problem.

This was the easy part. In hindsight, I should've just moved on and work on the
landing page so I can release FaceOff earlier, and fix the problem later.

# 4. Landing Page Design

I asked my friend [@bearwithclaws](http://twitter.com/bearwithclaws), of
[Hacker Monthly](http://hackermonthly.com/), to do the design (you should
subscribe to his magazine, because it's the best way to keep up with Hacker News
without having to obessively check it every 30 seconds).

He came up with the idea to use Mark Zuckerberg's profile pictures as part of
the demo. So when the like button is blocked, Mark Z. is facing away and isn't
watching. And when the like button is enabled, Mark Z. is facing your way, and is
watching. I thought that was pretty funny, and not too malicious.

We stole those pictures from Wired magazine's [profile of Mark
Zuckerberg](http://www.wired.com/techbiz/startups/news/2007/09/ff_facebook). I
guess we can afford a few good laughs until Wired send me a cease and desist
letter to take the pictures down (hopefully never).

Check out the final [landing page for FaceOff](http://getfaceoff.com).

# 5. Metrics & A/B Testing

I've always included Google Analytics for my projects. But to be honest, I never
learned much from Google Analytics. Rather, it is to me a fun ego booster that
allowed me to see a spike when people are checking out my stuff, and a
corresponding spike in my sense of well-being.

This time I set out to do something different. I thought about the things I
wanted to find out.

1. What is the conversion rate for downloading the extension?
2. What is the conversion rate for Twitter following?
3. What is the conversion rate for Github watching/forking?

With these goals in mind, I could design the metrics I needed to track, rather
than vanity stats I wanted to track.

I decided to try out [GetClicky](http://getclicky.com), just so I can use a different tool. I learned
from [PeopleWare](http://www.amazon.com/Peopleware-Productive-Projects-Teams-Second/dp/0932633439/ref=sr_1_1?ie=UTF8&qid=1316019451&sr=8-1)
that a productivity gain often follow from merely doing something different. So I
thought using a different tool would force me to look at data from a fresh perspective.

For the Lean Kata, I vowed to include at least one A/B test. I looked for an
obvious improvement. I decided to try [Visual Website
Optimizer](http://visualwebsiteoptimizer.com), because it seems to be the
easiest way for a beginner to start A/B testing.

I was expecting my A/B testing tool to prove to me that the obvious improvement
I came up with would increase conversion. The result of the A/B test was
surprising. Needless to say, A/B testing proved me wrong. I changed,

![control](http://i467.photobucket.com/albums/rr40/hdyeh2000/control.png)

To,

![variation](http://i467.photobucket.com/albums/rr40/hdyeh2000/variation.png)

Making the description of the extension more visual I thought was a clear
win. Yet it turned out that this "obvious improvement" resulted in a 20%
decrease in conversion rate.

# 6. Launch

I submitted FaceOff to Hacker News on a weekend. My rationale was that hackers
and entrepreneurs don't rest on weekends, but PR firms do. So on weekends there
would be roughly the same amount of votes as weekdays, but distributed over
fewer submissions. Thus on a weekend, my submission might have a lesser risk
getting swept away by others.

I got 3 friends to upvote within the first hour to increase the chance of it
appearing on the front page. (Everybody does this, right?)

I also posted on Reddit.

Then I tweeted about it. And that was that.

# Stats

I launched on September 11th.

![visitors](http://i467.photobucket.com/albums/rr40/hdyeh2000/09-11-stats.png)

- 10am: 235 visitors
- 11am: 252 visitors
- 12am: 265 visitors
- 1pm:  102 visitors 
- 2pm:  59  visitors

[getFaceOff.com](http://getfaceoff.com) had 1,070 visitors that day.

- The extension was downloaded 238 times. Conversion rate was ~22%.
- The Github repo was visited 65 times. Resulting in 6 new watchers. 0.5%.
- My Twitter profile was visited 20 times. Resulting in 7 new followers. 0.6%.

About 80% of the visits came from HackerNews. Less than 10 visits came from
Reddit. It would've made more sense if I posted on the programming SubReddit.
Not many hits from both Twitter and Facebook. {what's not many?}

There was a drop of traffic from Hacker News at around 1pm, due to the FaceOff
submission falling off from the front page. Which was rather surprising. It fell
to 27th in rank, with 19 votes, at one hour old. The 24th and 25th in rank are
both one hour old, yet with 3 votes each.

![HN Votes](http://i467.photobucket.com/albums/rr40/hdyeh2000/hn-votes.png)

My guess is it got flagged by a moderator. Oh well.

