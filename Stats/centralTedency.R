# getting working directory
getwd()

# set working directory
setwd('/Users/cottalucas/Documents/dataScience/ds-2017/R')

# reading baseball csv file ˜
bb <- read.csv('baseball.csv', header = TRUE, sep=',')

# summaring the dataset
summary(bb)

# glimpse on the dataset
head(bb)

# finding the mean and median of 5 variables
meanHR<- mean(bb$hr)
medianHR <- median(bb$hr)

# checking mode 
#?mode

#TODO

# Lets analyze the home runs
hist(as.integer(bb$hr), main = "Cool Histogram", xlab ="HomeRuns")
abline(v=meanHR, col='red', lwd = 3)
abline(v=medianHR, col='blue', lwd = 3)


# creating df by colunms

#names <- colnames(bb[8:13])

#df <- data.frame(names)
#df$mean <- mean
#df$median <- median

#df
