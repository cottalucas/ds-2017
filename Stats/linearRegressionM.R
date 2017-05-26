?freeny
data(freeny)

df = data.frame(freeny)

# Does the previous Q1 predict Q2?
lm()

freeny.y

fit = lm(y ~ lag.quarterly.revenue, data = df)
summary(fit)

plot(df$y ~ df$lag.quarterly.revenue)
