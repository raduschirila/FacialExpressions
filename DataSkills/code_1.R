#radarCharts are hard but R makes them impossible!!!!!
library(fmsb)
library(ggplot2)
library(tidyverse)
data <- read.csv("Andbrain_DataSet.csv")
data <- as.data.frame(data)

print("Starting Analysis")
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
moods <- c("fear","happy","sad","anger","neutral","surprise","disgust")
summary(data)

most_disgust <- which.max(data$disgust)
most_surprise <- which.max(data$surprise)
most_neutral <- which.max(data$neutral)
most_anger <- which.max(data$anger)
most_sad <- which.max(data$sad)
most_happy <- which.max(data$happy)
most_fear <- which.max(data$fear)

#set up fmsb function parameters with maxima and minima 

word_profiles <- rbind(rep(0.2,8),rep(0,8),data[most_anger,2:8],data[most_fear,2:8],data[most_neutral,2:8])
radarchart(word_profiles, pcol = colors_in ,pfcol = colors_in, cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8)


