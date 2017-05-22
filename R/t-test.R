# drawing 1000 set of observations with 30 samples, alpha=0.5 
# one for X	~	N(50,	5) and	one	from	X	~	N(45,5)

# declaring the observations
obs1 = vector('integer')
obs2 = vector('integer')

# first observation
obs1 = c(obs1, rnorm(30, mean=50, sd=5))   


# second observation
obs2 = c(obs2, rnorm(30, mean=45, sd=5))   

# running t test on both observations
ttest = t.test(obs1, obs2)
ttest

# getting the confidence interval
ttest$conf.int

# getting the estimate means
ttest$estimate

alphas = c(0.05, 0.1, 0.25, 0.5)
# lets generate 1000 t-tests to better look in the properties 
for (alpha in alphas) {
  nTests = 1000
  counterTrue = 0
  counterFalse = 0

  for (interable in 1:nTests) {
    # take two samples from DIFFERENT populations
    obs1 = rnorm(30, mean=45, sd=5)
    obs2 = rnorm(30, mean=45, sd=5)
    ttest = t.test(obs1, obs2)
  
    if (ttest$p.value > alpha) { 
      counterTrue = counterTrue + 1
    } else {
      counterFalse = counterFalse + 1
    }
  }

  print(paste("Alpha:", alpha))
  print(paste("Reject hypothesis:", counterTrue))
  print(paste("Accept hypothesis:", counterFalse))
}
