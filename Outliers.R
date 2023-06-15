#OUTLIER DETECTION

#Grubb's Test 
#H0=There are no outliers in the data
#H1=There is one outlier in the data
library(dplyr)
library(outliers)
data("iris")
grubbs.test(iris$Sepal.Length)
#p=0.9 > 0.05 we do not reject H0
#There are no outliers in the data

grubbs.test(iris$Petal.Length)
#p=1>0.05 No outliers in the data
#We do not reject H0

#Test the lower value
test<-grubbs.test(iris$Petal.Width,opposite = TRUE)
test
#p=1 > 0.05 We do not reject H0

#Exercise HW3
library(mlbench)
data("Glass")

# Some first observations on the data
# show us that most values are between the numbers 0.1 and 0.6
# we can spot a few data points that differ from the others like the max 6.21

#Let's try the Grubb's Test
#if the p value is near to 0 - stronger evidence of an outlier
#if the p value is near 1 - weaker evidence of an outlier

grubbs.test(Glass$K)
#The maximum value 6.21 has a p value that is almost 0
#therefore 6.21 is an outlier

grubbs.test(Glass$K , opposite = TRUE)
#Testing the minimum value 0 to get a clue about the opposite side
#0 has a p value of 1 , not considered an outlier

which.max(Glass$K)

Glass$K <- na_if(Glass$K, max(Glass$K))

summary(Glass$K) #New max 2.7


grubbs.test(Glass$K)
#Similarly the p value for 2.7 is almost 0
# 2.7 is an outlier
Glass$K <- na_if(Glass$K , 2.7)


grubbs.test(Glass$K)
# 1.76 is an outlier with p value almost 0
Glass$K <- na_if(Glass$K , 1.76)

grubbs.test(Glass$K)
# 1.68 is an outlier with a p value almost 0
Glass$K <- na_if(Glass$K , 1.68)

grubbs.test(Glass$K)
# 1.46 is an outlier with a p value 0.01

Glass$K <- na_if(Glass$K , 1.46)

grubbs.test(Glass$K)
# 1.41 , p = 0.01

Glass$K <- na_if(Glass$K , 1.41)

grubbs.test(Glass$K)
# possible outlier 1.1 with a p value 0.8
# p is closer to 1 than 0 



###

Glass$k <-replace(Glass$K,173,NA)

which(is.na(Glass$K))

