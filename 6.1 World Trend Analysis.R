#IMPORT DATA SET

?read.csv()

#method1: select file manually

stats<-read.csv(file.choose())
stats

#method2: set working directory and read data from there
getwd()
setwd()
#windows
setwd()"C:\\Users\\Nikki\\Desktop\\R"
#Mac

setwd("/Users/nikkismit/Desktop/R/Section 5")
getwd()
rm(stats)
stats <-read.csv("DemographicData.csv")
stats

#-------------exploring data

nrow(stats) #195 rows
ncol(stats) #5 columns
head(stats) #shows first 5 rows
head(stats, n=10)
tail(stats) #bottom 6 rows
str(stats) #str usually means string in other languages. Here it means STRUCTURE
#runif() ->random uniform

summary(stats)

#-------USING $-----
head(stats)
#extract birthrate for angola
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
levels(stats$Income.Group) #tells us the factors and their levels

#---BASIC OPERATION WITH DF----

stats[1:10,]#first 10 rows and all columns
stats[c(4,100),] #4th and 100th row and all columns

# if u extract one row , it will turn into a vector. In a df it will remain a df so NO NEED FOR drop=f
stats[1,]
is.data.frame(stats[1,])

stats[,1] 
is.data.frame(stats[,1]) #not a df anymore!
stats[,1, drop=F] #TO PRESERVE THE DATA FRAME

#math operations
stats$Birth.rate*stats$Internet.users
stats$Birth.rate+stats$Internet.users


#add a column to data frame
stats$mycalc <- stats$Birth.rate+stats$Internet.users
head(stats)

#test knowledge
#you want to add a vector of 5 rows into a df of 165 rows. What will happen?

stats$xyz <-1:5
head(stats, n=10)  #the vector gets recycled! but only if the cevtor is a factor of the df i.e. 5 goes into 195

#remove a column

stats$mycalc<- NULL
stats$xyz <-NULL
head(stats) #removed!

#---------FILTERING DFs

head(stats)
stats$Internet.users < 2  #comparing to 2. This is a vector

filter <- stats$Internet.users < 2
stats[filter,] #returns internet users <2 (so all rows of true values of our filter are displayed)

#countries with birth rate over 40
stats[stats$Birth.rate >40,] 

stats[stats$Birth.rate >40 & stats$Internet.users <2,]

stats[stats$Income.Group == "High income",]

stats[stats$Country.Name =="Malta",]


#----------INTRODUCTION TO QPLOT

install.packages("ggplot2")
library(ggplot2)

qplot(data=stats, x=Internet.users)  
qplot(data=stats, x=Income.Group, y= Birth.rate)  
qplot(data=stats, x=Income.Group, y= Birth.rate, size=I(3) )  #ADD I to size to stop R from mapping data to the value
qplot(data=stats, x=Income.Group, y= Birth.rate, size=I(3), colour=I("blue")) #colour and color both work
qplot(data=stats, x=Income.Group, y= Birth.rate, geom = "boxplot") 

#------------------VISUALISATION
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, colour = I("red"),size =I(3))

#colour by income group
qplot(data=stats, x=Internet.users, y=Birth.rate, colour = Income.Group,size =I(3))

#how many births per 1000 ppl on y axis and on x axis is 
#more than 50% of population have access to intern, but low birth rate (high income group)
#low income group have very high birth rate (4 to 5 times more than high income group) but less than 25% of  them have access to internet 
#correlation is not causation!

#---------------BUILDING DATA FRAMES

#CODE REGIONS

#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

#(c) Kirill Eremenko, www.superdatascience.com

#how do we put these vectors into a data frame?

mydf<- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#lets change the names
colnames(mydf) <- c("Country", "Code", "Region") #new names typed in brackets
head(mydf)

#let's recreate mydf in a quicker way
my_new_df<- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)
head(my_new_df)   #TIMES SAVED, YES!
tail(my_new_df)   #check data set makes sense
summary(my_new_df) 

#---------MERGING DATA FRAMES
head(stats)
head(my_new_df)
#How can we combine these 2 dfs?
#We will combine by code, ehich is safer than by country name. Codes are always more reliable and unique

merged<-merge(stats, my_new_df, by.x = "Country.Code", by.y = "Code")
merged  #has 7 variables and not 8. Let's check it out

head(merged) #code column from 2nd dataset is missing. But we matched it so R took the duplicate away

#we want to remove one of the contry columns

merged$Country <-NULL
str(merged)
tail(merged) #data makes sense

#------------Visualise this new data frame we merged

head(merged)
qplot(data=merged, x= Internet.users, y= Birth.rate, colour = Region) 
#let's fix it up

#1.shapes (each shape has a code. So we will use code 5)
qplot(data=merged, x= Internet.users, y= Birth.rate, colour = Region, size=I(5), shape=I(2)) #google R shapes to see the shape codes

#2. Transparency
qplot(data=merged, x= Internet.users, y= Birth.rate, colour = Region, 
      size=I(5), shape=I(19), alpha= I(0.6)) #0=FULLY TRANSPARENT, 1 IS OPAQUE
#3. Title
qplot(data=merged, x= Internet.users, y= Birth.rate, colour = Region, 
      size=I(5), shape=I(19), alpha= I(0.6), main= "Birth Rate vs. Internet Users") 

#-------------WORLD TRENDS
#Set the Working Directory
getwd()

#Import the csv dataset
data <- read.csv("WorldData.csv")

#Explore the data
data
head(data)      #check top 6 rows
tail(data, n=7) #check bottom 7 rows - missing life expectancy variable! And the year is now 2013
str(data)      #check the structure of the data frame. Note that year is int and not a factor!
summary(data)      #check the summary of the data

#Did you pick up that there is more than one year in the data?
#From the challenge we know that there are two: 1960 and 2013, hence why country.code is 2 and not one

#changing year into a factor
data$Year
temp<-factor(data$Year)
temp
levels(temp)

#Filter the dataframes - to make a data frame for each year
data1960 <- data[data$Year==1960,] #',' so that we have all columns for 
data2013 <- data[data$Year==2013,]

#Check row counts of the 2 df's
nrow(data1960) #187 rows
nrow(data2013) #187 rows. Equal split.

#Create the additional dataframes
add1960 <- data.frame(Code=data1960$Country.Code, Life.Exp=data1960$Life_Expectancy_at_Birth_1960)

add2013 <- data.frame(Code=data2013$Country.Code, Life.Exp=data2013$Life_Expectancy_At_Birth_2013)


#Check summaries
summary(add1960)
summary(add2013) #life expectancy increased 

#Merge the pairs of dataframe- note, check for duplicates before merging
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y ="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y ="Code")

#Check the new structures
str(merged1960)
str(merged2013)

#We can see an obsolete column in each of the merged dataframes
#Column "Year" is no longer required. Let's remove it
merged1960$Year <- NULL
merged2013$Year <- NULL

#Check structures again
str(merged1960)
str(merged2013)

#Visualization time
library(ggplot2)

#Visualize the 1960 dataset
qplot(data1960=merged1960, x=Fertility.Rate, y=Life.Exp,
   colour=Region,                               #colour
   size=I(5), 
   alpha=I(0.6),                               #transparency
   main="Life Expectancy vs Fertility (1960)" #title
)

#Visualize the 2013 dataset
qplot(data2013=merged2013, x=Fertility.Rate, y=Life.Exp,
      colour=Region,                               #colour
      size=I(5), 
      alpha=I(0.6),                               #transparency
      main="Life Expectancy vs Fertility (1960)" #title
)



#African countries were high fertility rate and low life expectancy. European countries have lower fertility rate 
#and a higher life expectancy.
#fertility dropped substantially over 53 years. 



