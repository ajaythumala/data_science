#data visualization
#mtcars is pre-loaded data
View(mtcars)

count <- table(mtcars$gear)

View(count)

#simple plot
plot(count)

barplot(count)

barplot(count,main="Simple Barplot",  #plot title
        xlab="Gears", #x-axis
        ylab="Count", #y-axis
        legend=rownames(count), #legend
        col=c('red','blue','yellow'))  #bar colors

pie(count)

pie(count, main = "Simple pie chart",
    col=c('yellow','blue','red'))

#ggplot
#install package
install.packages("ggplot2")
#import
library(ggplot2)

#salary data
income <- read.csv('salary_data.csv')

View(income)

plot(income)

ggplot(income, aes(x=Experience,y=Salary))+geom_point()

ggplot(income, aes(x=Experience,y=Salary))+geom_line()

#histogram with daily expenses
expense <- read.csv('dailyexpenses.csv')
View(expense)

ggplot(expense,aes(x=Medical))+
  geom_histogram(binwidth = 15,
                 color='red',
                 fill='yellow')

#piechart
pc <- read.csv('piechart.csv')
View(pc)

pie <- ggplot(pc,aes(x="",y=amount,fill=factor(expense)))+
  geom_bar(width=1,stat="Identity")+
  labs(fill="expenses",
       x=NULL,y=NULL,title="Pie Chart of Expenses")

plot(pie)

pie + coord_polar(theta = 'y',start=0)

#installed flexdashboard






