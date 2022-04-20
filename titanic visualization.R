#import 
library(ggplot2)

titanic <- read.csv('titanic.csv', stringsAsFactors = FALSE)

View(titanic)

str(titanic)

#converting datatypes

titanic$sex <- as.factor(titanic$sex)
titanic$pclass <- as.factor(titanic$pclass)
titanic$survived <- as.factor(titanic$survived)
titanic$embarked <- as.factor(titanic$embarked)

str(titanic)

ggplot(titanic,aes(x=survived))+
  geom_bar()

ggplot(titanic,aes(x=survived))+
  geom_bar()+
  theme_classic()+
  labs(y="Passenger count",
       title="Titanic Survival Count")

#gender wise survival
ggplot(titanic,aes(x=sex,fill=survived))+
  theme_light()+
  geom_bar()+
  labs(y="Passenger Count",
       title="Passenger Survival Count by Gender")

#class wise survival
ggplot(titanic,aes(x=pclass,fill=survived))+
  theme_light()+
  geom_bar()+
  labs(y="Passenger Count",
       title="Passenger Survival Count by Class")

#faceting the data
ggplot(titanic,aes(x=sex,fill=survived))+
  theme_light()+
  facet_grid(~pclass)+
  geom_bar()+
  labs(y="Passenger Count",
       title="Titanic Survival count by class and gender")

#age group of dead onboard
ggplot(titanic,aes(x=age))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y="Passenger Count",
       x="Age",
       title="Titanic age distribution")

ggplot(titanic,aes(x=age,fill=survived))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y="Passenger Count",
       x="Age",
       title="Titanic age distribution")

ggplot(titanic,aes(x=survived,y=age))+
  theme_bw()+
  geom_boxplot(binwidth = 5)+
  labs(y="age",
       x="survived",
       title="Titanic survival rate by age")

#density plot
ggplot(titanic,aes(x=age,fill=survived))+
  theme_bw()+
  facet_wrap(sex~pclass)+
  geom_density(alpha=0.5)+
  labs(y="age",
       x="survived",
       title="Titanic survival rate by age, class and gender")


