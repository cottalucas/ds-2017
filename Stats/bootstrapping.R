vect = c(8,12,58,94,103,115)
means = vector(mode='integer')

# number of interactions
for (interable in 1:1000) {
  # sampling
  localSample = sample(vect, 6, replace = TRUE ) 
  # getting the total mean (mean of means)
  means = c(means, mean(localSample))
  # plotting the histogram with the local and global means
  hist(means, col = 'darkgray', border = 'white', main = "Boostrapping with 95% confidence")
  abline(v=mean(localSample), col = "royalblue", lwd = 3)
  abline(v=mean(means), col = "red", lwd = 3)
  
  # 95% confidence interval level 
  stds = sd(means)
  n = length(means)
    # getting the boudaries within the confidence interval
  left = mean(means) -1.96 * stds
  right = mean(means) + 196 * stds
  # plotting the 95% confidence interval
  abline(v=left, col = "black", lty=2, lwd = 2)
  abline(v=right, col = "black", lty=2, lwd = 2)
  
  Sys.sleep(0.3)
}

