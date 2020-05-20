---
layout: single
title:  "My first post with R and knitr"
date:   2020-05-20 20:54:50 +1000
categories: [R, knitr]
output:
  md_document:
    variant: gfm
    preserve_yaml: TRUE
---

Make a graph with **ggplot** in **R**.



Dolore ea amet sit pariatur. Anim velit id siqt cupidatat magna minim ea excepteur magna do. Voluptate esse proident exercitation dolor Lorem velit ad fugiat sit. Laboris excepteur fugiat amet mollit esse aliquip. Minim anim nisi id ex sunt in mollit pariatur in mollit voluptate fugiat. Consequat enim voluptate fugiat labore. Reprehenderit mollit deserunt adipisicing do proident ex et mollit veniam in amet in.




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

![plot of chunk typical_graph](/assets/img/r_figs/typical_graph-1.png)

Here is a graph produced with ggplot and a few modifications to the theme.
