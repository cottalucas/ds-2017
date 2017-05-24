means = vector(mode='integer')
localDist = vector(mode='integer')

for (interable in 1:100) {
  localDist = c(localDist, rlogis(50, 0, scale = 5))
  means = c(means, mean(localDist))
  hist(localDist, col = 'darkgray', border = 'white', main = 'From Logistic to normal distribution*')
  abline(v=mean(means), col = "red", lwd = 3)
  Sys.sleep(0.3)
}


