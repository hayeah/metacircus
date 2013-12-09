---
layout: post
title: RabbitMQ Seems Slow?
---

As I am working on a message-passing actor library for Ruby using
RabbitMQ, I wanted to have some idea of its performance. In one test,
I push 1000 messages from one ruby process to another, and in another,
I use `ab` to run 1000 requests through the `Thin` webserver.

This is stupidly naive. It ignores the rich, flexible, and reliable
message passing functionalities that RabbitMQ has to offer (which is
why I am interested in the first place), and compares it to something
entirely different. 

Nevertheless, for this naive test, Thin, out of the box, outperforms
RabbitMQ by a factor of two to three. I suspect the problem is
Ruby. Although both Thin and the AMQP gem use Eventmachine, Thin has
the mongrel C HTTP parser, while the AMQP gem client is written
entirely in Ruby.

I'll want to look deeper into this.
