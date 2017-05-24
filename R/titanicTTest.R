# importing the dataset
titanic = read.csv('titanic.csv')

# checking dependent variables
colnames(titanic)

# creating a df from the dataset 
df = data.frame(titanic)
head(df)

# getting a dataframe copy where age is present
clean_df = na.omit(df, df$Age)

# checking if the data is parametric or non parametric
hist(clean_df$Age[clean_df$Survived == 1])
hist(clean_df$Age[clean_df$Survived == 0]) # -> non parametric distribution

# lets test the null hyp: There are a difference of the means of ages based on if they survived or not
#which means that the age was relevant 
#to the independent variable 
wilcox.test(clean_df$Age[clean_df$Survived == 0], clean_df$Age[clean_df$Survived == 1])
# p-value -> 0.1917
# with p-value > 0.05 we can reject the null hypothesis, which means that the age of a passenger was
#irrelevant to the independent variable (surviving factor)

# lets test the null hyp: men's age mean are greater than women's age mean
#which means that the genre was relevant 
hist(clean_df$Age[clean_df$Sex == 'male'])
hist(clean_df$Age[clean_df$Sex == 'female']) # -> non parametric distribution

wilcox.test(clean_df$Age[clean_df$Sex == 'male'], clean_df$Age[clean_df$Sex == 'female'], alternative = 'g')
# p-value -> 0.06
#which means the we reject the null hypothesis and that the mean of the ages of men 
#aren't greater than the women's age who survived.
