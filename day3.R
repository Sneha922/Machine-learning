Data <- read_csv("C:/Users/trc/Desktop/Data.csv")
Data$Age <- ifelse(is.na(Data$Age),ave(Data$Age, FUN = function(x) mean(x, na.rm = TRUE)),Data$Age)

Data$Salary <- ifelse(is.na(Data$Salary),ave(Data$Salary, FUN = function(x) mean(x, na.rm = TRUE)),Data$Salary)

Data$Country = factor(Data$Country, levels = c('France','Germany','Spain'), labels = c(1,2,3)) 
Data$Purchased = factor(Data$Purchased, levels = c('No','Yes'), labels = c(0,1))
Data$Age = as.numeric(format(round(Data$Age, 0)))
Data$Salary = as.numeric(format(round(Data$Salary, 0)))

install.packages('caTools')
library(caTools)
set.seed(123)

sample = sample.split(Data$Purchased,SplitRatio = 0.8)

training_set = subset(Data,sample == TRUE)

test_set = subset(Data, sample == FALSE)
training_set
test_set
training_set[,3] = scale(training_set[,3]) 
test_set[,3] = scale(test_set[,3])
training_set
test_set
hist(training_set)

library("graphics")
library("datasets")
data(Data)
str(Data)

plot(Data$Country, xlab = "Age", ylab = "Salary", col = "red")
hist(Data$Age,xlab = "Age", main = "Histogram for DATA", col = "yellow")
Data[1:10, ]
head(Data, 5)
tail(Data, 5)