source("DecisionTreeClassificationUtils.R")
library(rpart)

#reading training set 
decisionTreeClassificationTrainingSet <- readRDS("DecisionTreeClassificationTrainingSet.RDS")

#feature scaling
decisionTreeClassificationTrainingSet[-3] = scale(decisionTreeClassificationTrainingSet[-3])

# Fitting DecisionTreeClassification to the Training set
decisionTreeClassification = rpart(formula = Purchased ~., data = decisionTreeClassificationTrainingSet)

#saving NaiveByesClassification model
saveDecisionTreeClassificationModel(decisionTreeClassification)
