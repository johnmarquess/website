library(knitr)
library(stringr)

# Define paths
base_dir <- "~/Projects/website/"
base_url <- "/"
rmd_dir <- "_rmd/"
output_dir <- paste0(base_dir, "_posts/")
fig_path <- "assets/img/r_figs/"
tmp_dir <- paste0(base_dir, "tmp/")
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