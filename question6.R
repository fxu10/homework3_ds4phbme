library(dplyr)
library(magrittr)
library(ggplot2)
library(tidyverse)
rawdat <- readLines("healthcare-spending.csv")
rawdat <- rawdat[3:56] # Manually remove some lines of text
dat <- read.csv(text=rawdat,header=TRUE)
rows <- as.matrix(dat[1])
dat <- as.data.frame(dat[,-1])

means <- as.matrix(rowMeans(dat))

mean_spending <- as.data.frame(as.matrix(cbind(rows,means)))

# Remove the first US entry which is not a state
mean_state_spending <- mean_spending[2:length(mean_spending[,1]),]
names(mean_state_spending) <- c("State","Spending")

ggplot(data = mean_state_spending, aes(x = State, y = Spending, fill = State)) + 
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 90)) + 
  theme(legend.position = "none")

