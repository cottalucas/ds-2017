library('gtools')
library('combinat')

data = c(112, 97, 101, 123, 99, 119)

# get all possible rearrengements of it in 2 groups 
g1 = combinations(6, 3, data)
g2 = g1[20:1,]

totalPerm = cbind(g1,g2)
totalPerm

totalMeans = rowMeans(g1) - rowMeans(g2)
totalMeans

meanObs = mean(data[1:3]) - mean(data[4:6])

hist(totalMeans)
abline(v=meanObs, lwd=4, col='blue')

criticValL = quantile(totalMeans, 0.025)
criticValH = quantile(totalMeans, 0.975)

abline(v=criticValL, lty=2, lwd=4, col='red')
abline(v=criticValH, lty=2, lwd=4, col='red')

# conclusion: the prob that the our observation was picked out random is statistically significant

# new test
#g1 = 110, 97, 98, 100, 103
#g2 = 123, 110, 119, 105, 106
data2 = c(110, 97, 98, 100, 103, 123, 109, 119, 105, 106)

# get all possible rearrengements of it in 2 groups 
g1 = combinations(10, 5, data2)
g2 = g1[nrow(g1):1,]

totalPerm = cbind(g1,g2)
totalPerm

totalMeans = rowMeans(g1) - rowMeans(g2)
totalMeans

meanObs = mean(data2[1:5]) - mean(data2[6:10])


hist(totalMeans, breaks = 6)
abline(v=meanObs, lwd=4, col='blue')

criticValL = quantile(totalMeans, 0.025)
criticValH = quantile(totalMeans, 0.975)

abline(v=criticValL, lty=2, lwd=4, col='red')
abline(v=criticValH, lty=2, lwd=4, col='red')

meanObs
criticValL
