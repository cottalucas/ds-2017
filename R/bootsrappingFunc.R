library('Lock5Data')
library('ggplot2')
data(CommuteAtlanta)

# lets try to get some insights on the time that people in Atlanta take to go to work

# exploring the dataset
str(CommuteAtlanta)
head(CommuteAtlanta)
?CommuteAtlanta

# standard error 
sampleMean = mean(CommuteAtlanta$Time) # -> 29.11

# creating a matrix to store the all the samples
# once we will run 1000 samples we need a 500*1000 matrix to store all the samples
# the number of observations -> 500
n = nrow(CommuteAtlanta)
sampleRun = 1000
boot.samples = matrix(sample(CommuteAtlanta$Time, size = sampleRun * n, replace = TRUE), ncol=sampleRun, byrow = n)

# Applying the mean for every observation
boot.statistics = apply(boot.samples, 1, mean)

# getting the standard deviation of this distribution (mean of means)
distMean = sd(boot.statistics)

# calculating the confidence interval
# rounding the margin error up and to one decimal place for more significance
me = ceiling(10 * 2 * distMean)/10 
confidenceInteval = round(sampleMean, 1) + c(-1, 1) * me

# printing the interval and mean of the means
confidenceInteval
mean(boot.statistics)

# plotting the histogram with the confidence interval
ggplot(data.frame(meanTime = boot.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.25,aes(y=..density..)) +
  geom_density(color="red", lwd=2.5) +
  geom_vline(xintercept=confidenceInteval, col='blue', lwd=2) +
  geom_vline(xintercept=mean(boot.statistics), col='black', lwd=2)

