par(mfrow=c(1,1))

sample = rnorm(5000, 170, 7)
hist(sample, breaks = 20)

# Percentage of the population between 170 and 175
percentage = subset(sample, subset=(sample>170))
percentage = subset(percentage, subset=(percentage<175))
(length(percentage)/length(sample)) * 100

# -> 25,68%

# What's height is taller than 70% of the population
quantile(sample, 0.7)
# -> 173,65cm

# If someone is 158cm tall, what percent of the population is shorter than they are?
mean(sample <= 158)
# -> 4,44%
ecdf(sample)(158)
# -> 4,44%

plot(ecdf(sample), main='ECDF - 158cm', col.01line = 'blue', col='blue', bg='white')
abline(v=158, lwd=3, col='goldenrod3')

?ecdf

# Find an internval that includes 50% of the population
interval1 = subset(sample, subset=(sample > quantile(sample, 0.25)))
interval1 = subset(interval1, subset=(interval1 < quantile(sample, 0.75)))
min(interval1)
max(interval1)

# Find an interval that includes 20% of the population 
interval2 = subset(sample, subset=(sample > quantile(sample, 0.30)))
interval2 = subset(interval2, subset=(interval2 < quantile(sample, 0.50)))
min(interval2)
max(interval2)
 