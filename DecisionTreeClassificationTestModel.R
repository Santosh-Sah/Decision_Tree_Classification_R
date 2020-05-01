source("DecisionTreeClassificationUtils.R")
library(rpart)

#reading testing set data
decisionTreeClassificationTestingSet <- readRDS("DecisionTreeClassificationTestingSet.RDS")

#feature scaling
decisionTreeClassificationTestingSet[-3] = scale(decisionTreeClassificationTestingSet[-3])

#reading DecisionTreeClassification model
decisionTreeClassificationModel = readRDS("DecisionTreeClassificationModel.RDS")

#predicting testing set result.
y_pred = predict(decisionTreeClassificationModel ,newdata = decisionTreeClassificationTestingSet[-3], type = "class")

#Saving prediced values for testing set
saveDecisionTreeClassificationPredictedValuesForTestingSet(y_pred)

