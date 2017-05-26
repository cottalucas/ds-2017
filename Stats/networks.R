library('igraph')

?sample_gnp

g = sample_gnp(20, 0.25)
degree_distribution(g)
plot(g)

get.edgeslist(g)
get.adjacency(g)
plot(g)

nodes = list(V(g))

V(g)$condition = rbinom(10,1,0.5)
E(g)$color = "black"
V(g)$color = factor(V(g)$condition, labels=c('blue'))
plot(g)


# clustering for treatment effects # 

g = sample_gnp(25,0.15)
degree_distribution(g)
plot(g)

get.edgelist(g)
get.adjlist(g)
graphMatrix = get.adjacency(g)
graphMatrix

firstNode = sample(10, size=1)
V(g)$condition = graphMatrix[firstNode,]
V(g)$color = as.character(factor(V(g)$condition, label=c('yellow', 'lightblue')))
V(g)[firstNode]$color = 'lightblue'

plot(g)
firstNode


