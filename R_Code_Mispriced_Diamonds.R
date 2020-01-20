#set working directory
setwd("~/Desktop/R/Section 2")
# Import the data and look at the first six rows
MyData <- read.csv(file = 'Data_Mispriced-Diamonds.csv')
head(MyData)

library(ggplot2)
install.packages("ggplot2")

    ggplot(data=MyData[MyData$carat <2.5,], aes(x=carat , y=price, colour = clarity)) +
      geom_point(alpha = 0.1) +
      geom_smooth()



#overlapping lines show mispricing of diamonds 