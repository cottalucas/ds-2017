# importing the dataset
plantGrowth = read.csv('PlantGrowth.csv')

# checking dependent variables
colnames(plantGrowth)

# creating a df from the dataset 
df = data.frame(plantGrowth)

# ratio and nominal variables
# lets check if the distributions are parametrics

hist(df$weight[df$group == 'ctrl'])
hist(df$weight[df$group == 'trt1'])
hist(df$weight[df$group == 'trt2']) # -> non parametric

control = df$weight[df$group == 'ctrl']
t1 = df$weight[df$group == 'trt1']
t2 = df$weight[df$group == 'trt2']

aov(control, t1, t2)
