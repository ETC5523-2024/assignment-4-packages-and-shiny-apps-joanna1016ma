## code to prepare `tornados` dataset goes here

library(tidyverse)

tornados <- read_csv("data-raw/tornados.csv")

usethis::use_data(tornados, overwrite = TRUE)
