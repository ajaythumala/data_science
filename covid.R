library(rvest)
library(robotstxt)
library(dplyr)

#check if the website can be scraped.
Path <- paths_allowed("https://www.mygov.in/corona-data/covid19-statewise-status/")

#assign a variable for the website url
link <- "https://www.mygov.in/corona-data/covid19-statewise-status/"

#read the html content
web <- read_html(link)

#view html content
View(web)

#extracting the columns from the html content using the html_nodes() function
#web%>%html_nodes("<name of the node>")

state_names<- web%>%html_nodes(".field-type-list-text .even")%>%html_text()


View(state_names)

confirmed <- web%>%html_nodes(".field-name-field-total-confirmed-indians .even")%>%html_text()
View(confirmed)


cured <- web%>%html_nodes(".field-name-field-total-confirmed-indians .even")%>%html_text()
View(cured)

deaths <- web%>%html_nodes(".field-name-field-cured .even")%>%html_text()
View(deaths)

#putting the data into a data frame

#variable
covid_india <- data.frame(state_names, confirmed, cured, deaths)

View(covid_india)

str(covid_india)

#converting data types

covid_india$confirmed=as.numeric(covid_india$confirmed)

covid_india$cured=as.numeric(covid_india$cured)

covid_india$deaths=as.numeric(covid_india$deaths)


#saving locally
write.csv(covid_india,"covid_list.csv")


