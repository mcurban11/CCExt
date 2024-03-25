#Aggregate climate meta risk data across thresholds for extinction

rm(list = ls())
#load libraries
library(dplyr)
#---------------------------------
#
#load data
setwd("C:/Users/mcu08001/Documents/1New Research/CC MetaRisk 2/Analysis")
data <- read.table("MetaRisk for aggreg 5.txt",header=T); attach(data) 

#collect relevant info about data
uni = unique(concat)
N.uni=length(uni)
P.adj=rep(NA,N.uni)
data2 = data.frame(matrix(NA,nrow = N.uni, ncol = ncol(data)))
ave.percent = rep(NA,N.uni)
max.percent = rep(NA,N.uni)
min.percent = rep(NA,N.uni)

colnames(data2) <- colnames(data)

#start for loop to aggregate
for (i in 1:N.uni) {
  xx = data[concat==uni[i],] #take each set of unique studies
  x.n = nrow(xx)              #number
  if (x.n > 3) {cat("Number of rows is >3 at", i, "\n")}
  Ext.1 = xx$N.Ext
  if (x.n == 1) {P.adj[i] = (Ext.1*xx$Threshold)/xx$Total.N}
  else {
  Ext.2 = c(Ext.1[2:x.n],0)
  Ext.diff = Ext.1 - Ext.2
  
  #Error checking
  if (is.na(max(Ext.diff))) {cat("Extinction is NA i =", i, "\n")} 
  if (any(duplicated(xx$Threshold) | duplicated(xx$Threshold, fromLast = TRUE)))  {cat("duplicated thresholds i =", i, "\n")}
  if (any(xx$Total.N != xx$Total.N[1])) {cat("different total Ns at i =", i, "\n")}
  if (any(Ext.diff < 0)) {cat("Ext differences < 0 at i =", i, "\n")}
  P.t = sum((Ext.diff*xx$Threshold)/xx$Total.N)
  if (P.t < 0) {cat("Extinction is < 0 at i =", i, "\n")}
      if (P.t > 1) {cat("Extinction is > 1 at i =", i, "\n")}
  P.adj[i] = P.t
  }  
  ave.percent[i] = mean(Ext.1)/xx$Total.N[1]
  max.percent[i] = max(Ext.1)/xx$Total.N[1]
  min.percent[i] = min(Ext.1)/xx$Total.N[1]  
  dat=data[concat == uni[i],]#add function to create x.n length data
  data2[i,] = dat[1,]
}

cols2delete<-c("Threshold", "N.Ext","percent","adj.perc")
data2 <- data2[, !names(data2) %in% cols2delete]
data2$ave.percent = ave.percent
data2$max.percent = max.percent
data2$min.percent = min.percent
data2$adj.percent = P.adj

plot(data2$ave.percent, data2$adj.percent)
abline(a=0, b=1)

plot(data2$max.percent, data2$adj.percent)
abline(a=0, b=1)

plot(data2$min.percent, data2$adj.percent)
abline(a=0, b=1)

write.table(data2, file = "MetaRisk2 aggthres 5.txt", sep = "\t", quote = FALSE, row.names = FALSE)
