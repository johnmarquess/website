---
layout: single
title: "How I set up this site"
date: 2020-05-23 +1000
categories: Jekyll
---

This article describes how to set up a static website with JEKYLL that allows direct posting of Rmarkdown files as blog posts. Jekyll is a static site generator that can create simple sites or blogs. It takes pages input in Markdown, Textile, Liquid, HTML, and CSS, and outputs complete static HTML pages. The site/blog can be posted on  GitHub pages, or as in this case hosted on a [Digitalocean](https://digitalocean.com) private web server. 
The purpose of this article is not to go into the details of setting up a jekyll site with a specific theme. It is  more so to show you how you can use jekyll static site generator to publish your Rmarkdown scripts as blog posts.

**Prerequisites**

- You need to have ruby installed on your system with the required gems (jekyll and bundler). I use Ubuntu and the steps to set up jekyll are described [here](https://jekyllrb.com/docs/installation/ubuntu/).
- I use bundler to install jekyll simply because it makes the install process quite simple
- This workflow should work regardless of whatever jekyll theme you use. I use  the [minimal mistakes](https://mmistakes.github.io/minimal-mistakes/) because I like the way it looks and it has extensive [configuration and customisation](https://mmistakes.github.io/minimal-mistakes/docs/configuration/) options.
- It is assumed R is installed on your system and you intend to use R to generate some of your blog posts. For the R code to run you will need the [knitr](https://yihui.org/knitr/) and [stringr](https://stringr.tidyverse.org/) packages installed.




**Process**

- Get everything up and running with jekyll. If you h
- Pick a theme. I used minimal mistakes
- Test everything is working
- 