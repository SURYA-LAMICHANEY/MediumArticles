
#Loading required libraries
library(ggplot2)
theme_set(theme_classic())
library(dplyr)
library(tidyverse)



#Loading the dataset
setwd("C:/Users/Sikkim/Desktop/ForMedium/Titanic")
data<-read.csv("titanic.csv")
attach(data)


#Glimpse of the dataset
glimpse(data)


#Counting number of male and female passengers
data %>% group_by(Sex) %>% summarize(count=n())
#Histogram of sex
ggplot(data,aes(Sex))+geom_bar(aes(fill=Sex),width=0.5)+
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) + 
  labs(title="Histogram of passenger gender")



#Counting the number of passengers who either died or survived 
data %>% group_by(Survived) %>% summarize(count=n())
#Histogram of survived variable
ggplot(data,aes(Survived))+geom_bar(fill="#FF9999",width=0.5)+
  labs(title="Histogram of survival")



#Counting the number of people died or survived genderwise
data %>% group_by(Survived,Sex) %>% summarize(count=n())
#Plotting histogram of sex and Survived
g <- ggplot(data, aes(Survived))
g + geom_bar(aes(fill=Sex), width = 0.5) + 
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) + 
  labs(title="Histogram of Survival gender wise")



#Visualizing distribution of Fare
x <- Fare
h<-hist(x, breaks=10, col="red", xlab="Fare per passenger(in British pound)",
main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)



#Counting the number of passengers for each Pclass category
data %>% group_by(Pclass) %>% summarize(count=n())
#Histogram of Pclass variable
ggplot(data,aes(Pclass))+geom_bar(fill="#FF9999")+
  labs(title="Histogram of Passenger class")



#Counting the number of passengers who embarked on the ship at different ports
data %>% group_by(Embarked) %>% summarize(count=n())
#Histogram of passengers embarked at different ports
ggplot(data,aes(Embarked))+geom_bar(aes(fill=Embarked),width=1)+
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) + 
  labs(title="Histogram of Passenger embarkation ports")



#Counting the number of passengers who embarked on the ship at different ports pclass wise
data %>% group_by(Embarked,Pclass) %>% summarize(count=n())
#Histogram of passengers embarked at different ports pclass wise
ggplot(data,aes(Pclass))+geom_bar(aes(fill=Embarked),width=1)+
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) + 
  labs(title="Histogram of Passenger embarkation ports class wise")



#Counting number of parents/childern of passengers on board
data %>% group_by(Parch) %>% summarize(count=n())
#Histogram of parch
ggplot(data,aes(Parch))+geom_bar(fill="pink",width=1)+
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) + 
  labs(title="Histogram of passengers travelling with their parents/childern")



#Counting number of siblings/spouses of passengers on board
data %>% group_by(SibSp) %>% summarize(count=n())
#Histogram of SibSp
ggplot(data,aes(SibSp))+geom_bar(fill="pink",width=0.5)+
  theme(axis.text.x = element_text(angle=0, vjust=0.6)) + 
  labs(title="Histogram of passengers travelling with their siblings/spouses")


#Counting number of passengers who either survived or died and their kith and keen
data %>% group_by(Survived,Parch,SibSp) %>% summarize(count=n())
