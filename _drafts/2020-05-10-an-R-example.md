---
layout: single
title: "Random test post - simulation of stochastic processes in R"
date: 2020-05-08 13:45:00 -0400
category: [R, Statistics]
---




I love 538's Riddler column, and the [April 10 puzzle](https://fivethirtyeight.com/features/can-you-catch-the-free-t-shirt/) is another interesting one. To quote:

> Over the course of three days, suppose the probability of any spammer making a new comment on this week’s Riddler column over a very short time interval is proportional to the length of that time interval. (For those in the know, I’m saying that spammers follow a [Poisson process](https://mathworld.wolfram.com/PoissonProcess.html).) On average, the column gets one brand-new comment of spam per day that is not a reply to any previous comments. Each spam comment or reply also gets its own spam reply at an average rate of one per day.

> For example, after three days, I might have four comments that were not replies to any previous comments, and each of them might have a few replies (and their replies might have replies, which might have further replies, etc.).

> After the three days are up, how many total spam posts (comments plus replies) can I expect to have?

This is a great opportunity for tidy simulation in R, and also for reviewing some of the concepts of stochastic processes (this is known as a [Yule process](https://en.wikipedia.org/wiki/Yule%E2%80%93Simon_distribution)). As we'll see, it's even thematically relevant to current headlines, since it involves exponential growth.

Solving a puzzle generally involves a few false starts. So I recorded [this screencast](https://www.youtube.com/watch?v=QtThluGted0) showing how I originally approached the problem. It shows not only how to approach the simulation, but how to use those results to come up with an exact answer.

### Simulating a Poisson process

The Riddler puzzle describes a Poisson process, which is one of the most important stochastic processes. A Poisson process models the intuitive concept of "an event is equally likely to happen at any moment." It's named because the number of events occurring in a time interval of length $$x$$ is distributed according to $$\mbox{Pois}(\lambda x)$$, for some rate parameter $$\lambda$$ (for this puzzle, the rate is described as one per day, $$\lambda=1$$).

How can we simulate a Poisson process? This is an important connection between distributions. The *waiting time* for the next event in a Poisson process has an [exponential distribution](https://en.wikipedia.org/wiki/Exponential_distribution), which can be simulated with `rexp()`.




{% highlight r %}
# The rate parameter, 1, is the expected events per day
waiting <- rexp(10, 1)
waiting
{% endhighlight %}



{% highlight text %}
##  [1] 0.1417638 2.7956808 1.2725448 0.3452203 0.5303130 0.2647746 2.6195738
##  [8] 1.2933250 0.5539181 0.9835380
{% endhighlight %}

For example, in this case we waited 0.14 days for the first comment, then 2.8 after that for the second one, and so on. On average, we'll be waiting one day for each new comment, but it could be a lot longer or shorter.

You can take the cumulative sum of these waiting periods to come up with the event times (new comments) in the Poisson process.
