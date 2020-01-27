getwd()
setwd("/Users/nikkismit/Desktop/R/Section 6")
getwd()
movies<-read.csv("7.2 Movie-Ratings.csv")
head(movies)

#fix names of columns

colnames(movies) <-c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies) #2 columns that are factors (categorical variables- in htis case they are levels)
summary(movies) #we dont want year to be numerical, it must be a factor (like genre)

#how to convert YEAR to a factor
factor(movies$Year) #it indicates levels in the last line
movies$Year<-factor(movies$Year)
summary(movies) #movies is now a factor
str(movies) #and it has 5 levels for 5 years

#----------Aesthetics

library(ggplot2)
#add geometry
ggplot(data=movies, aes(x=CriticRating, y= AudienceRating)) + 
  geom_point()

#add colour
ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                        colour= Genre))+ 
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                        colour= Genre, size=Genre))+ 
  geom_point()  #why would thriller be bigger than action? Doesn't make sense

#let's fix this

ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                        colour= Genre, size=BudgetMillions))+ 
  geom_point() #this makes more sense. Bigger bubbles= bigger budget

# Let's improve this graph further. This is only our basic graph

#---------Plotting with layers (you add it by using "+")
p<- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                        colour= Genre, size=BudgetMillions))  #we created an object

p  #we need to set geometry and other layers using '+'

p+ geom_point()
p+ geom_line()

#multiple layers
p+ geom_line() + geom_point()

p+ geom_point() + geom_line()  #you can see that order of layers is NB (this plot is meaningless)

#---------Overriding Aesthectics
q<- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                            colour= Genre, size=BudgetMillions)) 

#add geom layer
q+ geom_point()

#we want to change an aesthetic in base plot (q)
#Ex 1
q+ geom_point(aes(size=CriticRating)) #the size we had in q has been replaced by critic rating instead of budget

#Ex 2 #override colour
q+ geom_point(aes(colour=BudgetMillions))

#note, q stays the same and when we override aesthetics, we are not changing the object, q, itself.

#we can override X and Y aswell

#Chart 2 (saved to pdf)
q+ geom_point(aes(x=BudgetMillions)) +
  xlab("Budget in Millions")

#Ex 4 - change line size
 q +geom_line(size = 1) +geom_point()  #where is aes??
 
  #we are mapping 
 
 #-----------Mapping vs. Setting
 q+ geom_point(aes(x=BudgetMillions)) +
   xlab("Budget in Million") #budget doesn't impact rating 
 
 r<- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r +geom_point() 


#Add colour
#1. Mapping (use aes)
r +geom_point(aes(colour=Genre)) 


#2. Setting (do not use aes)
r +geom_point(colour="DarkGreen") 

#Error
r +geom_point(aes(colour="DarkGreen") )  #doesn't give us the colour we ask for
#you are mapping and not seeting the colour

#1. Mapping

r +geom_point(aes(size=BudgetMillions)) 

#2. Setting
r +geom_point(size=10) 

#ERROR
r +geom_point(aes(size=10)) #incorrect size. This is not size 10

#--------------Histograms and Density charts
s<- ggplot(data=movies, aes(x=BudgetMillions))

s +geom_histogram(binwidth = 10) #most movies has a lower budget (skewed )

#add colour
s +geom_histogram(binwidth = 10, fill="Green") #this sets colour

#let's map colour
s +geom_histogram(binwidth = 10, aes(fill=Genre))

#add a border
#Chart 3 (saved to pdf)
s +geom_histogram(binwidth = 10, aes(fill=Genre), colour= "black")


#Sometimes you need a desnity chart
s +geom_density(aes(fill=Genre), position = "stack" ) #wont save and report this, difficult to explain to executives what a pdf is


#---------Starting Layer Tips

t<- ggplot(data=movies, aes(x=AudienceRating))
t+ geom_histogram(binwidth = 10,
                  fill="White", colour = "Blue") #setting not mapping. Blue is for border

#Mean is around 50/60. We see a normal distribution. GREAT!

#another way
#chart 4 (save as pdf)
t<-ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White", colour = "Blue") #same result as above

#Note, the second way is easier to chaneg if you wanted to change the x value
#Because you did not need to recreate t. 
#Say we wanted to look at Critic rating:, you just change x in the second part

#chart 5
t<-ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),  #just change x here
                   fill="White", colour = "Blue") 

#Note how critic rating is not normally distributed but uniformly distribute
#Critics rely on a set of rules to assess a movie, audience do not


#--------------Statistical Transformations

?geom_smooth #observe trends and relationships

u<- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                            colour=Genre))
u+ geom_point() +geom_smooth(fill=NA) 
#romance- if critics give it a low rating, then most likely that the audience will rate it high (over 50)
#horror and action- if critics give a horro and an action movie a high rating of 75, then statistically the audience are
#more likely to give the action movie a higher rating than the horror
#smoother helps us see these trends (dots are too many to see whats happening)

#boxplots-favourites for executives

u<- ggplot(data=movies, aes(x=Genre, y=AudienceRating, 
                            colour=Genre))

u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) +geom_point() #still cant read this. But there is a hack!

u + geom_boxplot(size=1.2) +geom_jitter() #random chaotic thing R does with out points

#this helps us see the data better!

#another way- save this as chart 6 in pdf
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)  #change order and transparency

#we see that based on genre, statisticaly, an action movie will on average get 50 or 60.
#highest rating is most likely to be a thriller 
#horrors get an averagely low rating
#dramas do well. We are looking at the middle line in the box which shows the average rating
#so thrillers have the highest mean out of all genres

#-----------using facets

v<- ggplot(data=movies, aes(x=BudgetMillions))

v+ geom_histogram(binwidth = 10, aes(fill=Genre))#super blurry!

v+ geom_histogram(binwidth = 10, aes(fill=Genre), 
                  colour = "Black") #more comic looking, but still not seeing what is going on 

#facets allow you to create lots of charts

v+ geom_histogram(binwidth = 10, aes(fill=Genre), 
                  colour = "Black") +
  facet_grid(Genre~.) #Genre is rows and to right of ~ is column. Axis make it difficult to read!


v+ geom_histogram(binwidth = 10, aes(fill=Genre), 
                  colour = "Black") +
  facet_grid(Genre~., scales= "free")
#actions have a lot of budget

#Let's apply facets to scatter plots

w<- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, colour = Genre))

w +geom_point(size=3)

#facets
w +geom_point(size=3) +facet_grid(Genre~.)


w +geom_point(size=3) +facet_grid(.~Year)


w +geom_point(size=3) +facet_grid(Genre~Year) #years in columns and genres in rows!


w +geom_point(size=3) + geom_smooth()+
  facet_grid(Genre~Year)  #now we see trends


w +geom_point(aes(size=BudgetMillions)) + geom_smooth()+ #add some mapping instead of setting size = 3
  facet_grid(Genre~Year)  #beautiful!


#this is chart number 1 but will still improve this already amazing chart

#see how y axis is negtaive? Let's fix this! 

#------Coordinates

#zlimits and zoom into axis
m<- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, size= BudgetMillions ,colour = Genre))

m +geom_point()

#say you want to only visualise the top/best quadrant? i.e. 50-100 ratings from audience and critics
m +geom_point() + 
  xlim(50,100) +
  ylim(50,100)

#won't work well always

n<- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  ylim(0,50)

#it did not work! data was cut off at top  of y. How do we zoom in then??

n+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim = c(0,50)) #data is still there without cutting out data


#IMPROVE OUR CHART 1(w)

w +geom_point(aes(size=BudgetMillions)) + 
  geom_smooth()+ 
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))
#we see romance picked up in 2011
#action is rated low by audience when critics rate it low
#but when critics rate it high, so do the audience
#comedy- audience rarely rate it low, but it has been hard for comedieis to get high ratings from audience 
#comedy ratings have been improving slowly over the years
#people like drama a lot, regardless of critic rating (above 50 over all years)



#---------------Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
o+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") 


# AXIS LABEL
h<- o+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") 

h + xlab("Money Axis") +
  ylab("Number of Movies") 

#label formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30))



#tick mark formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x =element_text(size=20),
        axis.text.y =element_text(size=20))

#Legend Formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x =element_text(size=20),
        axis.text.y =element_text(size=20),
        legend.title =element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),#top right corner legend
        legend.justification = c(1,1))   #anchor legend so not cut off


#adding a title for plot

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x =element_text(size=20),
        axis.text.y =element_text(size=20),
        legend.title =element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1), 
        legend.justification = c(1,1),
        plot.title = element_text(colour="DarkBlue", 
                                  size=30, 
                                  family = "Courier"))  #family is the font




#-------------------CHALLENGE

#The previous consultant had created a chart for them which is illustrated on the next slide. 
#However, the R code used to create the diagram has since been lost and cannot be recovered.
#Your task is to come up with the code that will re-create the same chart making it look as close as possible to the original.
#A new dataset has been supplied.

#Import the Data
getwd()
mov <- read.csv("7.3Movie_Challenge_Data.csv")

#Data Exploration
head(mov) #top rows
summary(mov) #column summaries
str(mov) #structure of the dataset

#Activate GGPlot2
#install.packages("ggplot2")
#library(ggplot2)

#{Offtopic} This Is A Cool Insight:
ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()
#Notice? No movies are released on a Monday. Ever.


#Apply the row filters to the dataframe
#Note that we have 66 Gneres and 131 Studios. We only neeed to visulaise 5 (according to the image we were given)

#Now we need to filter our dataset to leave only the 
#Genres and Studios that we are interested in
#We will start with the Genre filter and use the Logical 'OR'
#operator to select multiple Genres:
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

#Now let's do the same for the Studio filter:
filt2 <- (Studio == "Buena Vista Studios") | (Studio == "WB") | (Studio == "Fox") | (Studio == "Universal") | (Studio == "Sony") | (Studio == "Paramount Pictures")

#Quicker way to do filt2
filter2<- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

filt
filter2

mov2 <- mov[filt & filter2,]
mov2
head(mov2)


#Prepare the plot's data and aes layers
#Note we did not rename the columns. 
#Use str() or summary() to fin out the correct column names
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p #Nothing happens. We need a geom.

#Add a Point Geom Layer
p + geom_point()  #FILTER WORKED BECAUSE WE HAVE 5 GENRES


#Add a boxplot instead of the points
p + geom_boxplot() 

#Notice that outliers are part of the boxplot layer
#We will use this observation later (*)

#Add points
p + 
  geom_boxplot() + 
  geom_point()
#Not what we are after

#Replace points with jitter
p + 
  geom_boxplot() + 
  geom_jitter()

#Place boxplot on top of jitter
p + 
  geom_jitter() + 
  geom_boxplot() 

#Add boxplot transparency
p + 
  geom_jitter() + 
  geom_boxplot(alpha=0.7) 

#Good. Now add size and colour to the points:
p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7) 

#See the remaining black points? Where are they from?
#They are part of the boxplot - Refer to our observation (*) above 

#Let's remove them (they are duplicates):
p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 

#Let's "Save" our progress by placing it into a new object:
q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 
q

#Non-data ink
q <- q +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q

#HINT: for the next part use ?theme if you need to 
#refresh which parameters are responsible for what

#Theme
q <- q + theme(
    #this is a shortcut to alter ALL text elements at once:
    text = element_text(family="Comic Sans MS"),
    
    #Axes titles:
    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),
    
    #Axes texts:
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),  
    
    #Plot title:
    plot.title = element_text(colour="Black",
                     size=40),
    
    #Legend title:
    legend.title = element_text(size=20),
    
    #Legend text
    legend.text = element_text(size=12)
  )
q

#Final touch. We haven't discussed this in the course,
#However this is how you can change individual legend titles:
q$labels$size = "Budget $M"
q

#Well done!
