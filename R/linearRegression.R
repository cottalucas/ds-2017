?cars

# getting the data
data(cars)

# summary
summary(cars)
# data framing 
car = data.frame(cars)

# linear regression
fit = lm(dist~speed, data=car)
summary(fit)

intercept = fit$coefficients[1]
slope = fit$coefficients[2]
intercept
slope

# plotting 
plot(car$dist~car$speed, pch = 16, cex = 1, col = "navy", main="Relationship (Speed x Stopping Distance)", xlab="Speed ", ylab="Stopping Distance ")
abline(fit, col='red', lwd=3)

# predictions
# 10.5 mph, 0 mph, 21mph
test = data.frame(speed=c(10.5, 0, 21))

# results 
result = predict(fit, newdata=test)
names(result) = c('for 10,5 mph', 'for 0 mph', 'for 21 mph')
result

# standardized coefficients
library(QuantPsyc)
lm.beta(fit)

car$speed_z = scale(car$speed)
car$dist_z = scale(car$dist)

#par(mfrow=c(1,2))

fit = lm(dist_z~speed_z, data=car)
plot(car$dist_z~car$speed_z, pch = 16, cex = 1, col = "navy", main="Relationship (Speed x Stopping Distance)", xlab="Speed ", ylab="Stopping Distance ")
abline(fit, col='red', lwd=3)


