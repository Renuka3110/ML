#Exploring dataset
library(ggplot2)
head(iris)
str(iris)
ggplot(iris, aes(Petal.Length, Petal.Width)) + geom_point(aes(col=Species), size=4)
#Performing k-means clustering
set.seed(100)
irisCluster <- kmeans(iris[,1:4], center=3, nstart=20)
irisCluster
#Finding out the ideal value for k
tot.withinss <- vector(mode="character", length=10)
for (i in 1:10){
irisCluster <- kmeans(iris[,1:4], center=i, nstart=20)
tot.withinss[i] <- irisCluster$tot.withinss
}
#Let’s visualise the plot of tot.withinss for different k values.
plot(1:10, tot.withinss, type="b", pch=19)
#Comparing the predicted clusters with the original data.
irisCluster <- kmeans(iris[,1:4], center=3, nstart=20)
table(irisCluster$cluster, iris$Species)
#We can also plot the predicted clusters as follows.
library(cluster)
clusplot(iris, irisCluster$cluster, color=T, shade=T, labels=0, lines=0)