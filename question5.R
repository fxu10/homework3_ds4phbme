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

# For a proper states index that is stacked vertically, exclude the US
more_states <- rep(states[2:length(states)], times=1, each=length(dat$Year))

# For stacking data vertically
restacked_dat <- as.data.frame(t(as.matrix(
  rbind(dat$Year, dat[,3]))))

for(i in c(4:length(names(dat)))){
  stateDat <- as.data.frame(t(as.matrix(rbind(dat$Year,dat[,i]))))
  restacked_dat <- rbind(restacked_dat,stateDat)
}
  
restacked_dat <- cbind(more_states, restacked_dat)
names(restacked_dat) <- c("State","Year","Spending")

ggplot(data=restacked_dat,aes(x=Year,y=Spending,group=State)) +
  geom_line(aes(color=State)) +
  geom_point(aes(color=State))

