---
layout: single
title:  "Making a graph in Rmarkdown with R and knitr"
date:   2020-05-23 +1000
categories: [R]
---

In this post I have made rudimentary plot using **ggplot** in **R** with the one of the stanrdard data sets (cars).



I have used the script from the previous post to convert the Rmarkdown script to a standard markdown script and save it in the `_posts` directory. It produces a graph which gets saved in the `assets/img/r_figs/` directory.




```r
ggplot(mpg, aes(x = displ, y = hwy, colour = factor(cyl))) +
    geom_point(size = 3, alpha = I(4 / 10)) +
    labs(x = "Highway mileage (miles per gallon)", y = "Displacement") +
    scale_colour_discrete(name = "Number of\ncylinders") +
    theme_minimal() +
    theme(
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14, color = "#3f3f3f", face = "bold"),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12)
    )
```
Here is the graph produced with ggplot and a few modifications to the theme.

![plot of chunk typical_graph](/assets/img/r_figs/typical_graph-1.png)


