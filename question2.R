library(dplyr)
library(magrittr)
library(ggplot2)
library(tidyverse)

dat <- read.table("classInterests.txt",header=TRUE)
dat <- as.data.frame(dat)

sophm <- filter(dat,Year=="Sophomore")
junior <- filter(dat,Year=="Junior")
senior <- filter(dat,Year=="Senior")
masters <- filter(dat,Year=="Master's")
phd <- filter(dat,Year=="PhD")

freq_sop <- as.data.frame(table(sophm$Program))
freq_sop <- cbind(c(rep("Sophomore",6)),freq_sop)
names(freq_sop)<-c("Year","Program","Frequency")
freq_jun <- as.data.frame(table(junior$Program))
freq_jun <- cbind(c(rep("Junior",6)),freq_jun)
names(freq_jun)<-c("Year","Program","Frequency")
freq_sen <- as.data.frame(table(senior$Program))
freq_sen <- cbind(c(rep("Senior",6)),freq_sen)
names(freq_sen)<-c("Year","Program","Frequency")
freq_mas <- as.data.frame(table(masters$Program))
freq_mas <- cbind(c(rep("Master's",6)),freq_mas)
names(freq_mas)<-c("Year","Program","Frequency")
freq_phd <- as.data.frame(table(phd$Program))
freq_phd <- cbind(c(rep("PhD",6)),freq_phd)
names(freq_phd)<-c("Year","Program","Frequency")

freq_df <- rbind(freq_sop,freq_jun, freq_sen, freq_mas, freq_phd)

ggplot(data=freq_df, aes(x=Year, y=Frequency, fill=Program)) +
  geom_bar(stat="identity") + ggtitle("Breakdown of Years by Program")

