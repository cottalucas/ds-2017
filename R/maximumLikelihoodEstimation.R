# loading library for maximum likelihood (ML) 
library('maxLik')

# generating mistery data
write.csv(rnorm(5000, mean=pi, sd=exp(2)), 'lucascotta_normal.csv')

# getting a mistery data 
md = read.csv('samuel_NormDist.csv', colClasses=c("NULL", NA))

# estimate the mean and variance of a random distribution
loglik = function(param){
  mu = param[1]
  sigma = param[2]
  ll = -0.5*N*log(2*pi) - N*log(sigma) - sum(0.5*(md - mu)^2/sigma^2)
  ll
}

N = nrow(md)

#starting with the wrong values
res = maxLik(loglik, start=c(0,1)) 
summary(res)

# fixed -> fixed one of the parameters 
resFix <- maxLik(loglik, start=c(mu=0, sigma=1), fixed='sigma')
summary(resFix)
