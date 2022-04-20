#importing data

dataset <- read.csv("top_movies.csv")
View(dataset)

#checking data and data types before cleaning and conversion.
str(dataset)

#import
library(dplyr)

#removing extra elements -- gsub() function
dataset$movie_year <- gsub("\\(|\\)","",dataset$movie_year)
dataset$movie_duration <- gsub("min","",dataset$movie_duration)


#converting data type
dataset$movie_year <- as.numeric(dataset$movie_year)

dataset$movie_duration <- as.numeric(dataset$movie_duration)

str(dataset)

#removing column
dataset = subset(dataset,select = -(X))

View(dataset)

#adding another column

#generating random numbers to fill column values
set.seed(124)

dataset$gross_dollars <- runif(50,min=10,max=10000)

View(dataset)

#'c' here is for combination.
dataset$rank <- c(1:50)

#rearranging columns
dataset <- dataset[c("rank","movie_name","movie_year","movie_duration","movie_rating","movie_genre","gross_dollars")]

#set few values as NA not available
dataset[1,7] <- NA
dataset[3,7] <- NA
dataset[4,7] <- NA

#filling values with average based on condition
#if else condition (condition, true statement, false statement)

dataset$gross_dollars <- ifelse(is.na(dataset$gross_dollars),
                                ave(dataset$gross_dollars, FUN = function(x) mean(x, na.rm=TRUE)),
                                dataset$gross_dollars)
#creating a watch list
dataset$watchlist <- dataset$movie_rating >8.6

#converting into factor datatype
dataset$watchlist <- as.factor(dataset$watchlist)

str(dataset)

#dealing with categorical values
dataset$watchlist <- factor(dataset$watchlist, levels = c("TRUE","FALSE"), labels=c(1,0))

str(dataset)


#assignment
# go to any website - scrap data, clean data

write.csv(dataset,"cleaned_movies.csv")

#after cleaning, how to analyze, start with visual analysis/representation


