library(knitr)
library(stringr)

# define paths
base_dir <- "/home/dude/Projects/website/"
base_url <- "/"
rmd_dir <- "_rmd/"
output_dir <- paste0(base_dir, "_posts/")
fig_path <- "assets/img/r_figs/"

opts_knit$set(base.dir = base_dir, base.url = base_url)
opts_chunk$set(fig.path = fig_path)


files <- list.files(paste0(base_dir, rmd_dir))

renamed_file <- str_replace(files[1], ".Rmd", ".md")

output_file <- paste0(output_dir, renamed_file)

setwd(rmd_dir)
knit(input = files[1], output = output_file)
setwd(base_dir)