#n is	the	number	of	draws	to	return
#p is	the	parameter	for	the	Bernoulli	distribution	–the	probability	of	getting
#par(mfrow=c(2,1))

myBernoulli = function(n, p){
  vect = vector(mode='numerical')
  
  for (interable in 1:n) {
    value = runif(1)

    if (value <= p) {
      vect = c(vect, 1)
    } else {
      vect = c(vect, 0)
    }  
  }
  #hist(vect, breaks = 2, main=paste(paste("Bernoulli Distribution with p = ", p), "with n =", n))
  return(vect)
}

#size is	the	number of trials
myBinomial = function(n, p, size){
  vectBi = vector(mode='integer')
  
  for (interable in 1:size){
    vectBi = c(vectBi, sum(myBernoulli(n,p)))
    print(vectBi)
  }
  hist(vectBi, breaks = size, main=paste(paste(paste("Binomial Distribution p =", p), ",n =", n), ',size =', size))
  return(vectBi)
}

myBinomial(5000,0.5,size=10)
