---
layout: single
title: "How I set up this site"
date: 2020-05-21 +1000
categories: Jekyll
---

This article describes how to set up a static website with jekyll that allows direct posting of Rmarkdown files as blog posts. Jekyll is a static site generator that can create simple sites or blogs. It takes pages input in Markdown, Textile, Liquid, HTML, and CSS, and outputs complete static HTML pages. The site/blog can be posted on  GitHub pages, or as in this case hosted on a [Digitalocean](https://digitalocean.com) private web server. 
The purpose of this article is not to go into the details of setting up a jekyll site with a specific theme. It is  more so to show you how you can use jekyll static site generator to publish your Rmarkdown scripts as blog posts.

**Prerequisites**

- You need to have ruby installed on your system with the required gems (jekyll and bundler). 
- Instructions to install and up jekyll on a mac are described [here](https://jekyllrb.com/docs/installation/macos/).
- I use bundler to install jekyll  because it makes the install process quite simple. Instrcutions [here](https://jekyllrb.com/tutorials/using-jekyll-with-bundler/)
- This workflow should work regardless of whatever jekyll theme you use. I use  the [minimal mistakes](https://mmistakes.github.io/minimal-mistakes/) because I like the way it looks and it has extensive [configuration and customisation](https://mmistakes.github.io/minimal-mistakes/docs/configuration/) options. I didn’t use the standard gem-based theme install, I cloned the minimal mistakes repo and put in the root folder of my site. I had a number of changes I wanted to make, particularly in the `_layouts` and `_includes` sections so this was an easier option for me.
- It is assumed R is installed on your system and you intend to use R to generate some of your blog posts. For the R code to run you will need the [knitr](https://yihui.org/knitr/) and [stringr](https://stringr.tidyverse.org/) packages installed.




**Process**

In a nutshell, everything you would expect from a jekyll site runs as normal. You add a new post to your `_posts` folder and name it using the standard naming convention. When it comes to writing an RMarkdown post there are a couple of changes to the workflow  that are required in order to change an `*.Rmd` post to an `*.md` post, and how to handle graphical output. So this approach solves two problems:

- converting a post written in Rmarkdown and save it as a regular markdown file in the `_posts` folder.
- saving images generated in the Rmarkdown script to a folder location such that they will be parsed in the markdown script and appear in the post.

To achieve this I wrote an R script and saved it in the root folder of website. It performs the following steps:

- Defines a number of paths to specific parts of the website,
- Sets `knitr` global and chunk options,
- Gets the filename of the Rmarkdown file and uses this to make a corresponding filename for a regular markdown file,
- Sets the working directory to the location of the Rmarkdown file,
- Knits the file and saves the output as a result markdown file in the `_posts` folder,
- Makes a backup of the original Rmarkdown file and stores it in a backup location (in case it needs to e edited later),
- Cleans up the files and shuts down R.

So, all is required is that your Rmarkdown blog post is saved in and `_rmd` folder in your website root. Save the following script in your website root and run it when you want to publish the post. Note - you shouls also add `*.Rmd` to the excludes section of your `config.yml` file.

Here is the R script. It is also available in the [repo](https://github.com/johnmarquess/website).

``` r
library(knitr)
library(stringr)

# Define paths
base_dir <- "~/Projects/website/"
base_url <- "/"
rmd_dir <- "_rmd/"
output_dir <- paste0(base_dir, "_posts/")
fig_path <- "assets/img/r_figs/"
tmp_dir <- paste0(base_dir, "_rmd.bak/")
opts_knit$set(base.dir = base_dir, base.url = base_url)
opts_chunk$set(fig.path = fig_path)

# This section used the name of the Rmd file and
# maes an new target (output) .md file with the same name
files <- list.files(paste0(base_dir, rmd_dir))
rmd_file <- files[1]
renamed_file <- str_replace(rmd_file, ".Rmd", ".md")
output_file <- paste0(output_dir, renamed_file)

# Change to the directory where the .Rmd file is located
# and knit it, specifying the target .md file
setwd(rmd_dir)
knit(input = rmd_file, output = output_file)

# Clean up the filesm but keep the original .Rmd file
# as you may need this later on for editing.
file.copy(rmd_file, tmp_dir)
file.remove(rmd_file)
setwd(base_dir)

# Quit R
q()

```
