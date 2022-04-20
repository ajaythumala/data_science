library(rvest)
library(robotstxt)
Path <- paths_allowed("https://en.wikipedia.org/wiki/World_population")
url <- "https://en.wikipedia.org/wiki/World_population"

my_html <- read_html(url)

View(my_html)

my_tables <- html_nodes(my_html,"table")

View(my_tables)

pop_tables <- html_table(my_tables)[[5]]

View(pop_tables)

pop <- pop_tables[,1:4]
View(pop)

str(pop)

write.csv(pop,"population_list.csv")


