library(dplyr)
library(magrittr)
library(ggplot2)
library(tidyverse)

rawdat <- readLines("healthcare-spending.csv")
rawdat <- rawdat[3:56] # Manually remove some lines of text
dat <- read.csv(text=rawdat,header=TRUE)
rows <- t(as.matrix(dat[1]))
dat <- as.data.frame(dat[,-1])
row.names(dat) <- rows
dat <- as.data.frame(t(as.matrix(dat)))
row.names(dat) <- c(1:length(dat[,1]))
states <- names(dat)
dat<-cbind(c(1991:2014),dat)
names(dat) <- c("Year",names(dat)[2:length(names(dat))])

dat <- within(dat, rm("United States"))

dat<-dat %>% pivot_longer(-Year, names_to = "State", values_to = "Spending")

ggplot(data=restacked_dat,aes(x=Year,y=Spending,group=State)) +
  geom_line(aes(color=State)) +
  geom_point(aes(color=State)) + 
  theme(legend.position="bottom")