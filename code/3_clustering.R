# Import the data file into R
  xy = read.csv("파일경로/3_clustering.csv", header=T,sep=",")

# Check if we imported the datafile successfully
  prin(xy)

# Scatter Plot of xy
  plot(xy[,2:3],pch=19,xlab=c("x1coordinate"), ylab=c("x2coordinate"),main="scatter plot of xy")
# Adding Sample Labels
  text(xy[,2],xy[,3],labels=xy[,1],cex=0.8,pos=1, col="blue")

# Construct Distance Matrix
  dist(xy,method = "euclidean")^2

# Hierarchical Clustering: Single Linkage Method
  hc_sl = hclust(dist(xy)^2, method="single")
  print(hc_sl)

# Dendrogram
  plot(hc_sl,hang=-1,cex=0.6)

# More Details
  rev(hc_sl)






# K-means clustering with sample information
  xy_k_means = kmeans(xy,3)
  print(xy_k_means)

# Scatter Plot of xy��s K-mean clusters
  cluster = xy_k_means$cluster
  xy_k_means_x_y = cbind(cluster, xy[,2:3])
  head(xy_k_means_x_y)

  y_k_means_x_y_ploy = transform(xy_k_means_x_y,cluster=as.factor(cluster))


install.packages("ggplot2", repos="http://healthstat.snu.ac.kr/CRAN")

# Scatter Plot of xy��s K-mean clusters
  library(ggplot2)
  xy_k_means_x_y_plot = ggplot(data=xy_k_means_x_y,aes(x=x1,y=x2,colour=cluster))+geom_point(shape=19,size=4)+ggtitle("Scatter Plot of xy's K-means clusters")
  xy_k_means_x_y_plot

# Add centroid points of cluster 1,2,3
  xy_k_means_x_y_ploy = transform(xy_k_means_x_y,cluster=as.factor(cluster))
  xy_k_means_centers = xy_k_means$centers
  xy_k_means_centers

my_k_means_x_y_plot_2 = xy_k_means_x_y_plot +
  annotate("point",x=1.516786621,y=12.465296,size=6,color="black")+
  annotate("point",x=1.013199310,y=11.896243,size=6,color="black")+
  annotate("point",x=-0.008280785,y=3.479631,size=6,color="black")
my_k_means_x_y_plot_2
