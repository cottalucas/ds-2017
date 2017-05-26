library(pwr)

data = read.csv('SD_beauty_data.csv')
#datafull <- read.dta("beautysleep_data.dta")

# What	are	the	conceptual variables and how are they operationalize?
# How	was	the	data was collected and what	do the variables represent?
# Describe the experimental	design, the	level	of analysis, the treatment?
# What would you have done differently in terms	of study design

#################################
# Information from the research #
#################################

# variables

# sd = sleep deprivation
# r_id = rater id
# f_id = face id
# beauty = attractive
# health = healthiness
# tired = tiredness

# power analysis

# sample size = 1495
# effect size =
# significance level = 0.95
# statistical power =

head(data)

# p < 0.01 (for all)

# header
names(data)
head(data)

# let's run the same model to compare the results
# multilevel mixed effects linear regression, with two crossed independent random effects
# the observations are combine 1by1 of each analysis

# spliting into two groups (with any and without sleep dep)
sdY = subset(data, sd==1)
sdN = subset(data, sd==0)

# creating the dataframes and ordering 
dfY = data.frame(sdY)
dfN = data.frame(sdN)

# ordering the dataframes for subtraction
noSleep = dfY[order(dfY[,1], dfY[,2]),]
sleep = dfN[order(dfN[,1], dfN[,2]),]

tail(sleep)
tail(noSleep)

# lets get the dataframes with the differences
beautyDiff = sleep$beauty - noSleep$beauty
tiredDiff = sleep$tired - noSleep$tired
healthDiff = sleep$health - noSleep$health

# power analysis
par(mfrow=c(1, 3))
hist(beautyDiff)
hist(healthDiff)
hist(tiredDiff)

# getting effect size 
dBT = cor(beautyDiff, tiredDiff)
dBT

pwr.t.test(n=length(beautyDiff), d=dBT, sig.level=.05) # power = 0.998



#attractiveness x health
t.test(beautyDiff, healthDiff) # p < 0.01

fit = lm(beautyDiff ~ healthDiff)
summary(fit)
plot(beautyDiff, healthDiff, pch = 16, cex = 0.5, col = "navy")
abline(lm(beautyDiff ~ healthDiff, data=data), col='red', lwd=3)

# attractiveness x tiredness
t.test(beautyDiff, tiredDiff) # p < 0.01

fit = lm(beautyDiff ~ tiredDiff)
summary(fit)
plot(beautyDiff, tiredDiff, pch = 16, cex = 0.5, col = "navy")
abline(lm(beautyDiff ~ tiredDiff, data=data), col='red', lwd=3)

# health x tiredness
t.test(healthDiff, tiredDiff) # p < 0.01

# linear regression of the differences 
fit = lm(healthDiff ~ tiredDiff)

# coefficient 
summary(fit)

plot(healthDiff, tiredDiff, pch = 16, cex = 0.5, col = "navy")
abline(lm(healthDiff ~ tiredDiff, data=data), col='red', lwd=3)

# Design I would change the type of the scale for categorical variables



