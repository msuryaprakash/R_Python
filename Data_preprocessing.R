Dataset = read.csv('Data.csv')
Dataset$Age = ifelse(is.na(Dataset$Age),
                     ave(Dataset$Age ,FUN = function(x) mean(x,na.rm=TRUE)),
                     Dataset$Age)
Dataset$Salary = ifelse(is.na(Dataset$Salary),
                        ave(Dataset$Salary ,FUN = function(x) mean(x,na.rm=TRUE)),
                        Dataset$Salary)

#Data Encoder to Categorical 
Dataset$Country = factor(Dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))
Dataset$Purchased = factor(Dataset$Purchased,
                           levels = c('No','Yes'),
                           labels = c(0,1))
install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(Dataset$Purchased,SplitRatio = 0.8)
training_set=subset(Dataset, split==TRUE)
testing_set=subset(Dataset,split==FALSE)

training_set[, 2:3] = scale(training_set[, 2:3])
testing_set[, 2:3]=scale(testing_set[, 2:3])

