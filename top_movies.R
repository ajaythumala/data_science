#importing libraries
library(robotstxt)
library(rvest)
library(dplyr)


Path <- paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")

url <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

#obtaining html info
web <- read_html(url)
View(web)

#movie name  .lister-item-header a
#movie year .text-muted.unbold
#movie rating .ratings-imdb-rating strong
#movie duration .runtime
#movie genre .genre

#data aquisition
movie_name<- web%>%html_nodes(".lister-item-header a")%>%html_text()
movie_year<- web%>%html_nodes(".text-muted.unbold")%>%html_text()
movie_rating<- web%>%html_nodes(".ratings-imdb-rating strong")%>%html_text()
movie_duration<- web%>%html_nodes(".runtime")%>%html_text()
movie_genre<- web%>%html_nodes(".genre")%>%html_text()

#putting it into a data frame
movie_data <- data.frame(movie_name,movie_year,movie_rating,movie_duration,movie_genre)

View(movie_data)

write.csv(movie_data,"top_movies.csv")




