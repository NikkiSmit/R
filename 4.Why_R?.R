#why should you use vectorized operations in R
#CREATE a vector made up of 5 random numbers

x<-rnorm(5)
x

#how do we print out each vector individually? Use a FOR loop
#R specific prgramming loop
for(i in x){    #this for loop went through x and assumed each number individually and printed it
  print(i)
}

#to print individually
print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])   # but this is laborious! It is an iterative process! (a monkey's job)

#a loop can take over
#conventional programming loop
for (j in 1:5) {
  print(x[j])   #j will iterate from 1 to 5
}

#so first i assumed the values of the vector (because x is a vector)
#j iterates from 1 to 5


#----------------------------

#compare vectorized vs de-vectorized operations



N<-10000000   #first 100 then 1000000 for speed test below
a<-rnorm(N)
b<-rnorm(N)

#vectorized approach
c<- a*b

#de-vectorized approach
d<- rep(NA,N) #100 NA values 
for (i in 1:N) {
  d[i] <- a[i] *b[i] 
}                      #takes more time

#vectorized operations are not only shorter but also faster!
#change N =100 to N =10000000 and see that loop takes longer 
#so other programming languages work better if you break the code down like in the loop above
#but in R the shorter code is faster and more efficient

#so when we use the de-vectorized approach:
#R is a high level programming language so it acts as a wrapper for C code or some other programming language code
# other code perfroms the hard labour for R


#If we use the vectorized approach, R relies on the fundamental property that a vector 
#can only contain variables of the same kind e.g. a (only contains dbl) and b((only contains dbl)
# it knows you can mix differnt elements inside a vector
#so R will only have to tell the other coding languages one time what to do hence why the code is so short
#this si where time is saved.




