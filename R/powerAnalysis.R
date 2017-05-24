library(pwr)

# power analysis 
# compare with pwr.t.test()

# case1 : d=.2 alpha=.01 beta =? n=100
pwr.t.test(n=100, d=.2, sig.level=.01) # -> 0.12034

# case2 : d=.5 alpha=.05 beta =? n=100
pwr.t.test(n=100, d=.5, sig.level=.05) # -> 0.9404

# case3 : d=.3 alpha=.05 beta =? n=100
pwr.t.test(n=100, d=.3, sig.level=.03) # -> 0.4733

# case4 : d=.3 alpha=.05 beta =.9 n=?
pwr.t.test(d=.2, sig.level=.01, power=.9) # -> 745.63


# to compare with each case
p_val = c()
for(x in 1:1000){
  sample1 = rnorm(50,50,5)
  sample2 = rnorm(50,51,5)
  
  ttest = t.test(sample1, sample2, var.equal=TRUE)
  p_val = c(p_val, ttest$p.value)
}
sum(p_val)