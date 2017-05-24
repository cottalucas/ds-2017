# getting working directory
getwd()

# set working directory
setwd('/Users/cottalucas/Documents/dataScience/ds-2017/R')

# getting the data
ec = read.csv('Employee_Compensation.csv')

df = data.frame(ec)

sum(df$Total.Compensation<0)

## there are 249 observations with negative Total Compensations, which doesn't make sense

# lets remove all the negative salaries 
df = subset(df, subset=(df$Total.Compensation>0))

# looking at the quartiles
quartiles = quantile(df$Total.Compensation)

# calculate IQR
iqr = IQR(df$Total.Compensation, na.rm = TRUE)

# calculating critical values
upperValue = quartiles[4] + 1.5 * iqr
lowerValue = quartiles[2] - 1.5 * iqr

# getting the values in between  the critical values
# removing outliers
outliers = subset(df$Total.Compensation, subset=(df$Total.Compensation < upperValue))
outliers = subset(outliers, subset=(outliers > lowerValue))

# split the plots into 1 row, 2 col
par(mfrow=c(1,3))
# overlayer the plots
#par(new=TRUE)

# plotting the data WITHOUT the outliers 
boxplot(outliers)

# plotting the data WITH the outliers 
boxplot(df$Total.Compensation)

# finding the critical values using the std
# 3 standard deviations
t = 3
upperValueSD = mean(df$Total.Compensation) + t * sd(df$Total.Compensation)
lowerValueSD = mean(df$Total.Compensation) - t * sd(df$Total.Compensation)

outliersSD = subset(df$Total.Compensation, subset=(df$Total.Compensation < upperValueSD))
outliersSD = subset(outliers, subset=(outliers > lowerValueSD))

boxplot(outliersSD)

upperValue
upperValueSD
