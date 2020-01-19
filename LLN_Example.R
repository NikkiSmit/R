#LLN
#Normal Distribution (rnorm())
#Let us assess whther LLN holds or not and use R to confirm that LLN holds
#note, 'i' is the variable itself and not an index like in most other languages

#Clue of the type of code we will be running:
N <- _     #SPECIFY SAMPLE SIZE
  counter <-  _ #RESET COUNTER
for (i in rnorm(N)) {       #ITERATE OVER VECTOR OF NUMBERS
  if( ___ & ___){               #CHECK WHERE ITERATED VARIABLES FALL
    
    counter<-  _______+ _             
  }
}
answer <- counter/_     #CALC HIT RATIO
answer                     #PRINT ANSWER IN CONSOLE


#rnorm(100) creates a vector of numbers drawn from a normal distribution, so you have 100 normally distributed variables
#so we want to create a loop that cycles through all these variables. SO we use a FOR loop
#lets go back to the basics of a FOR loop:

for(i in 1:10){      #1:10 is a vector of 10 numbers. So we cycle this index (i) through these 10 numbers
}                     #but we want to replace this 1:10 vector with rnorm(100)

for(i in rnorm(100)){      #note: everytime we run rnorm(100) the numbers will be different
} 


#so we want to check, does i fall between -1 and 1?
for(i in rnorm(100)){       #note: everytime we run rnorm(100) the numbers will be different
  if(i>-1 & i<1){           #the curly brackets indicate the body of the if statement
                            #note: we use i as the variable istelf insted of using i as an index, like done in many other languages.
                            #in other languages it would be if(a[i]>-1 & a[i]<1), where 'a' is your array. In our case, i takes on the value of each variable in the rnorm vector instead of taking on 1,2,3...100
  }                         #hence, we are checking if each of the values generate using rnorm(100) (indicated by i), is >-1 or <1
}

#alternatively, if 'i' confuses you, replace it with x

counter <-0
for (i in rnorm(100)) {       #so what if our if statement condition is true? We are counting the amount of numbers from our rnorm() vector that fall between -1 and 1
  if(i>-1 & i<1){             #so how many of the values in our rnorm vector satisfy our if condition ?
    counter <- counter +1     #so what we need before the loop is a counter variable starting at 0, then after it counted the first variable that satisfies the confition it must count the next value
                              #the counter will increase everytime the condition is TRUE
  }
}
counter                       #we print out how many of these values were counted so we print out counter. 
                              #everytime you rerun the entire code (starting from our rnorm vector) the value counter produces will be slightly different
                              #we want to compare this to 68.2% (within 1 stdev)


counter <-0
for (i in rnorm(100)) {       
  if(i>-1 & i<1){            
    counter <- counter +1     

  }
}
counter / 100    #BECAUSE WE ARE COMPARING TO A PERCENTAGE OF 68.2%
                  #if you change N =1000 then you will see we get closer to our precentage of 68.2%! 

#we don't want to keep changing N manually so lets control it by making it a variable:

N<-1000  #INPUT
counter <-0
for (i in rnorm(N)) {       
  if(i>-1 & i<1){            
    counter <- counter +1     
  }
}
counter / N

#thus we confirmed LLN holds as n increases