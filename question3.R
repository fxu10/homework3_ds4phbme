install.packages("ggmosaic")
library(ggmosaic)
library(dplyr)
library(magrittr)
library(ggplot2)
library(tidyverse)

dat <- read.delim("classInterests.txt",header=TRUE)

# I used the library ggmosaic

ggplot(data = dat) +
  geom_mosaic(aes(x = product(Year), fill=Program)) + 
  labs(x="Student's Year")
  ggtitle("Breakdown of Years by Program")

