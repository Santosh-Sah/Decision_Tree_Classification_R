source("DecisionTreeClassificationUtils.R")
library(rpart)

#reading DecisionTreeClassification model
decisionTreeClassificationModel = readRDS("DecisionTreeClassificationModel.RDS")

inputValue <- data.frame(Age = c(28,30), EstimatedSalary = c(43000,30000))
inputValue[, 1:2] = scale(inputValue[, 1:2])


#predicting testing set result.
y_pred = predict(decisionTreeClassificationModel, newdata = inputValue, type = "class")

y_pred
