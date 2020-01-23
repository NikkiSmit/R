
# Matrices:
# - FieldGoalAttempts
# - FieldGoals
# - Games
# - MinutesPlayed
# - Salary
# Vectors:
# - Players
# - Seasons
#www.superdatascience.com

#Copyright: These datasets were prepared using publicly available data.
#           Reference:  www.superdatascience.com 

#Comments:
#Seasons are labeled based on the first year in the season
#E.g. the 2012-2013 season is preseneted as simply 2012

#Notes and Corrections to the data:
#Kevin Durant: 2006 - College Data Used
#Kevin Durant: 2005 - Proxied With 2006 Data
#Derrick Rose: 2012 - Did Not Play
#Derrick Rose: 2007 - College Data Used
#Derrick Rose: 2006 - Proxied With 2007 Data
#Derrick Rose: 2005 - Proxied With 2007 Data

#Seasons vector
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#Players vector
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#Salary vectors
KobeBryant_Salary <- c(15946875,17718750,19490625,21262500,23034375,24806250,25244493,27849149,30453805,23500000)
JoeJohnson_Salary <- c(12000000,12744189,13488377,14232567,14976754,16324500,18038573,19752645,21466718,23180790)
LeBronJames_Salary <- c(4621800,5828090,13041250,14410581,15779912,14500000,16022500,17545000,19067500,20644400)
CarmeloAnthony_Salary <- c(3713640,4694041,13041250,14410581,15779912,17149243,18518574,19450000,22407474,22458000)
DwightHoward_Salary <- c(4493160,4806720,6061274,13758000,15202590,16647180,18091770,19536360,20513178,21436271)
ChrisBosh_Salary <- c(3348000,4235220,12455000,14410581,15779912,14500000,16022500,17545000,19067500,20644400)
ChrisPaul_Salary <- c(3144240,3380160,3615960,4574189,13520500,14940153,16359805,17779458,18668431,20068563)
KevinDurant_Salary <- c(0,0,4171200,4484040,4796880,6053663,15506632,16669630,17832627,18995624)
DerrickRose_Salary <- c(0,0,0,4822800,5184480,5546160,6993708,16402500,17632688,18862875)
DwayneWade_Salary <- c(3031920,3841443,13041250,14410581,15779912,14200000,15691000,17182000,18673000,15000000)
#Matrix using rbind() fn. rm() used to remove vectors
Salary <- rbind(KobeBryant_Salary, JoeJohnson_Salary, LeBronJames_Salary, CarmeloAnthony_Salary, DwightHoward_Salary, ChrisBosh_Salary, ChrisPaul_Salary, KevinDurant_Salary, DerrickRose_Salary, DwayneWade_Salary)
rm(KobeBryant_Salary, JoeJohnson_Salary, CarmeloAnthony_Salary, DwightHoward_Salary, ChrisBosh_Salary, LeBronJames_Salary, ChrisPaul_Salary, DerrickRose_Salary, DwayneWade_Salary, KevinDurant_Salary)
colnames(Salary) <- Seasons
rownames(Salary) <- Players

#Games 
KobeBryant_G <- c(80,77,82,82,73,82,58,78,6,35)
JoeJohnson_G <- c(82,57,82,79,76,72,60,72,79,80)
LeBronJames_G <- c(79,78,75,81,76,79,62,76,77,69)
CarmeloAnthony_G <- c(80,65,77,66,69,77,55,67,77,40)
DwightHoward_G <- c(82,82,82,79,82,78,54,76,71,41)
ChrisBosh_G <- c(70,69,67,77,70,77,57,74,79,44)
ChrisPaul_G <- c(78,64,80,78,45,80,60,70,62,82)
KevinDurant_G <- c(35,35,80,74,82,78,66,81,81,27)
DerrickRose_G <- c(40,40,40,81,78,81,39,0,10,51)
DwayneWade_G <- c(75,51,51,79,77,76,49,69,54,62)
#Matrix
Games <- rbind(KobeBryant_G, JoeJohnson_G, LeBronJames_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, ChrisPaul_G, KevinDurant_G, DerrickRose_G, DwayneWade_G)
rm(KobeBryant_G, JoeJohnson_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, LeBronJames_G, ChrisPaul_G, DerrickRose_G, DwayneWade_G, KevinDurant_G)
colnames(Games) <- Seasons
rownames(Games) <- Players

#Minutes Played
KobeBryant_MP <- c(3277,3140,3192,2960,2835,2779,2232,3013,177,1207)
JoeJohnson_MP <- c(3340,2359,3343,3124,2886,2554,2127,2642,2575,2791)
LeBronJames_MP <- c(3361,3190,3027,3054,2966,3063,2326,2877,2902,2493)
CarmeloAnthony_MP <- c(2941,2486,2806,2277,2634,2751,1876,2482,2982,1428)
DwightHoward_MP <- c(3021,3023,3088,2821,2843,2935,2070,2722,2396,1223)
ChrisBosh_MP <- c(2751,2658,2425,2928,2526,2795,2007,2454,2531,1556)
ChrisPaul_MP <- c(2808,2353,3006,3002,1712,2880,2181,2335,2171,2857)
KevinDurant_MP <- c(1255,1255,2768,2885,3239,3038,2546,3119,3122,913)
DerrickRose_MP <- c(1168,1168,1168,3000,2871,3026,1375,0,311,1530)
DwayneWade_MP <- c(2892,1931,1954,3048,2792,2823,1625,2391,1775,1971)
#Matrix
MinutesPlayed <- rbind(KobeBryant_MP, JoeJohnson_MP, LeBronJames_MP, CarmeloAnthony_MP, DwightHoward_MP, ChrisBosh_MP, ChrisPaul_MP, KevinDurant_MP, DerrickRose_MP, DwayneWade_MP)
rm(KobeBryant_MP, JoeJohnson_MP, CarmeloAnthony_MP, DwightHoward_MP, ChrisBosh_MP, LeBronJames_MP, ChrisPaul_MP, DerrickRose_MP, DwayneWade_MP, KevinDurant_MP)
colnames(MinutesPlayed) <- Seasons
rownames(MinutesPlayed) <- Players

#Field Goals
KobeBryant_FG <- c(978,813,775,800,716,740,574,738,31,266)
JoeJohnson_FG <- c(632,536,647,620,635,514,423,445,462,446)
LeBronJames_FG <- c(875,772,794,789,768,758,621,765,767,624)
CarmeloAnthony_FG <- c(756,691,728,535,688,684,441,669,743,358)
DwightHoward_FG <- c(468,526,583,560,510,619,416,470,473,251)
ChrisBosh_FG <- c(549,543,507,615,600,524,393,485,492,343)
ChrisPaul_FG <- c(407,381,630,631,314,430,425,412,406,568)
KevinDurant_FG <- c(306,306,587,661,794,711,643,731,849,238)
DerrickRose_FG <- c(208,208,208,574,672,711,302,0,58,338)
DwayneWade_FG <- c(699,472,439,854,719,692,416,569,415,509)
#Matrix
FieldGoals <- rbind(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
rm(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
colnames(FieldGoals) <- Seasons
rownames(FieldGoals) <- Players

#Field Goal Attempts
KobeBryant_FGA <- c(2173,1757,1690,1712,1569,1639,1336,1595,73,713)
JoeJohnson_FGA <- c(1395,1139,1497,1420,1386,1161,931,1052,1018,1025)
LeBronJames_FGA <- c(1823,1621,1642,1613,1528,1485,1169,1354,1353,1279)
CarmeloAnthony_FGA <- c(1572,1453,1481,1207,1502,1503,1025,1489,1643,806)
DwightHoward_FGA <- c(881,873,974,979,834,1044,726,813,800,423)
ChrisBosh_FGA <- c(1087,1094,1027,1263,1158,1056,807,907,953,745)
ChrisPaul_FGA <- c(947,871,1291,1255,637,928,890,856,870,1170)
KevinDurant_FGA <- c(647,647,1366,1390,1668,1538,1297,1433,1688,467)
DerrickRose_FGA <- c(436,436,436,1208,1373,1597,695,0,164,835)
DwayneWade_FGA <- c(1413,962,937,1739,1511,1384,837,1093,761,1084)
#Matrix
FieldGoalAttempts <- rbind(KobeBryant_FGA, JoeJohnson_FGA, LeBronJames_FGA, CarmeloAnthony_FGA, DwightHoward_FGA, ChrisBosh_FGA, ChrisPaul_FGA, KevinDurant_FGA, DerrickRose_FGA, DwayneWade_FGA)
rm(KobeBryant_FGA, JoeJohnson_FGA, LeBronJames_FGA, CarmeloAnthony_FGA, DwightHoward_FGA, ChrisBosh_FGA, ChrisPaul_FGA, KevinDurant_FGA, DerrickRose_FGA, DwayneWade_FGA)
colnames(FieldGoalAttempts) <- Seasons
rownames(FieldGoalAttempts) <- Players

#Points
KobeBryant_PTS <- c(2832,2430,2323,2201,1970,2078,1616,2133,83,782)
JoeJohnson_PTS <- c(1653,1426,1779,1688,1619,1312,1129,1170,1245,1154)
LeBronJames_PTS <- c(2478,2132,2250,2304,2258,2111,1683,2036,2089,1743)
CarmeloAnthony_PTS <- c(2122,1881,1978,1504,1943,1970,1245,1920,2112,966)
DwightHoward_PTS <- c(1292,1443,1695,1624,1503,1784,1113,1296,1297,646)
ChrisBosh_PTS <- c(1572,1561,1496,1746,1678,1438,1025,1232,1281,928)
ChrisPaul_PTS <- c(1258,1104,1684,1781,841,1268,1189,1186,1185,1564)
KevinDurant_PTS <- c(903,903,1624,1871,2472,2161,1850,2280,2593,686)
DerrickRose_PTS <- c(597,597,597,1361,1619,2026,852,0,159,904)
DwayneWade_PTS <- c(2040,1397,1254,2386,2045,1941,1082,1463,1028,1331)
#Matrix
Points <- rbind(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
rm(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
colnames(Points) <- Seasons
rownames(Points) <- Players


#Data has been inserted
#Let's look at the data
Salary   #top 10 player's salaries in 2005-2014
Games
MinutesPlayed


#creating a matrix
#cbind() combined columns

c1<-1:5
c2<- -1:-5
D<- cbind(c1,c2)
D
#matrix()

my_data <-1:20
A <- matrix(my_data,4,5)
A
A[2,3]

b<-matrix(my_data,4,5, byrow = T) #this matrix is populated differntly to A
b
b[2,5]

#rbind() combine rows

r1<-c("I", "AM", "HAPPY") 
r2<- c("what", "a", "day")
r3 <-c(1,2,3)

C<- rbind(r1,r2,r3)
C

#NAMED VECTORS
Charlie<- 1:5
Charlie
#GIVE NAMES
names(Charlie) <- c("a", "b", "c", "d", "e")
names(Charlie)
Charlie
Charlie["d"]

#clear names
names(Charlie)<- NULL
Charlie

#naming matrix dimensions
#note the difference
rep(c("a", "B", "zZ"), times =3)
rep(c("a", "B", "zZ"), each = 3)
#we will use each
temp.vec <- rep(c("a", "B", "zZ"), each = 3)
temp.vec

bravo<- matrix(temp.vec,3,3) #matrix(data, rows, columns)
bravo

#assign row names
rownames(bravo) <- c("how", "are", "you")
bravo

#assign column names
colnames(bravo) <- c("X", "Y", "Z")
bravo

#Let's put a 0 in the middle
bravo["are", "Y"] <- 0
bravo


#let's get back to the basketball data
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2013"]

#Matrix operations
#How many field goals did each player score per game?
round(FieldGoals/Games,1)

#how many minutes played per game?
round(MinutesPlayed/Games, 1)

#VISUALISATION using Matplot()

#how have filed players been scoring over time?
matplot(FieldGoals) #this just plots each column. We want rows so we must transpose the matrix

t(FieldGoals)
matplot(t(FieldGoals), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch = 15:18, horiz=F)

#let's normalize the data
matplot(t(FieldGoals/Games), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch = 15:18, horiz=F) #this shows which players scored field goals per game


matplot(t(FieldGoals/FieldGoalAttempts), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch = 15:18, horiz=F)  #accuracy that these players have. DwightHoward has most accuray


#SUBSETTING
#create a vector
x<-c("a", "b", "c", "d", "e")
x
x[c(1,5)]  #this is subsetting vector x
x[1]

Games
#let's look at the stats of the top 3 players for last 5 years
Games[1:3,6:10] #the subset of matrix is also a matrix

#stats of the  top and bottom player compared across all years?
Games[c(1,10),]

#let's just look at 2008 and 2009 for all players

Games[,c("2008", "2009")]

#we just want the first row
Games[1,] #but this is not what we want, where are the row and column names ?

is.matrix(Games[1,])  #This is NOT a matrix!
is.vector(Games[1,])  #it is a vector

# So in a vector you have rows,columns, drop.
# drop is by default set to TRUE
# So we set it to FALSE

Games[1,,drop=F] #the second comma is indicating all columns to be selected
#R will try guess what you are asking for if you do not set drop=false


#Visualising Subsets

matplot(t(MinutesPlayed), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch = 15:18, horiz=F) #this shows which players scored field goals per game

#so say we want to see a subset of the top 3 players only?

Data <- MinutesPlayed[1:3,]
Data
t(Data)
matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players


#what if we want to just look at the top player?

Data <- MinutesPlayed[1,]
Data
matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players

#we see a problem here. Similar to earlier, [1,] is NOT  matrix!
#lets drop=f again and fix this 
Data <- MinutesPlayed[1,, drop=F]
Data
matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players


#FUNCTIONS- designed to encapsulate code

#This is what we want to encapsulate
Data <- MinutesPlayed[1,, drop=F]
matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players

#very similar to the format of a loop
myplot<- function(){
  Data <- MinutesPlayed[2,, drop=F]
  matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[2], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players
}

myplot()

#but say we want to change the players, we don't want to keep changing our code
#this is where PARAMTERS come in
#replace the player number (2) with rows and also add it in function("rows")
myplot<- function(rows){
  Data <- MinutesPlayed[rows,, drop=F]
  matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players
}
#and you specify in your myplot() which players you want to see
myplot(1:5) 

#lastly, we want to use this function to visualise other datasets
#so let us create another parameter for data

myplot<- function(data,rows){   #add data parameter
  Data <- data[rows,, drop=F]   #replace data name with data parameter
  matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players
}

myplot(Salary, 1:5) #so we see the salaries for the first 5 players



#if we want to make a default row (i.e. default players to visualise)
#we can specify it in the function as below:

myplot<- function(data,rows=1:10){   #we make the default all 10 players
  Data <- data[rows,, drop=F]   
  matplot(t(Data), type = "b",pch = 15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch = 15:18, horiz=F) #note how we subset the players
}

myplot(Salary) #so say the person didn't specify which palyers it will give us the default


#BASKETBALL INSIGHTS

#SALARY
myplot(Salary) #KobeBryant earns the most

#let's look at salary per game
myplot(Salary/Games) #KobeBryant and JoeJohnson were both injured in 2013/14 season and so their salaries are higher
myplot(Salary/FieldGoals)
#get rid of these anomalies
#because they still earn a salary regardless if they play the game or not -i.e. if they are injured it doesn't imapct their salary
#but their in game metrics  are impacted 

#In-game metrics
myplot(MinutesPlayed)
myplot(Points)

#let's normalize in game metrics by in game metrics
myplot(FieldGoals/Games) #comparable regardless of injury or not i.e. goals per game played
myplot(FieldGoals/FieldGoalAttempts) #accuracy of player- DwightH is most accurate player
myplot(FieldGoalAttempts/Games)#He is at bottom for number of attempts, so his accuracy rate is high because he has limited attempts
#you can also say that if he had to increase his attempts he might get more in?
myplot(Points/Games)

#Interesting Observations
myplot(MinutesPlayed/Games)#mins per game has been decreasing over years for all players?
myplot(Games) #number of games being played is consistent

#Time is valuable
myplot(FieldGoals/MinutesPlayed)
#Kevin Durant scores most field goals per game so he uses his time the best 

#player style
myplot(Points/FieldGoals) 
#Kevin first scored less points (going for 2 point shots) then he started scoring more points (going for 3 point shots)



