source("DecisionTreeClassificationUtils.R")

#reading DecisionTreeClassification model
decisionTreeClassificationModel = readRDS("DecisionTreeClassificationModel.RDS")

#reading testing set data
decisionTreeClassificationTestingSet <- readRDS("DecisionTreeClassificationTestingSet.RDS")

#reading predicted values of the testing set
decisionTreeClassificationPredictedValuesForTestingSet <- readRDS("DecisionTreeClassificationPredictedValuesForTestingSet.RDS")

decisionTreeClassificationConfusionMatrix = table(decisionTreeClassificationTestingSet[, 3], decisionTreeClassificationPredictedValuesForTestingSet)

decisionTreeClassificationConfusionMatrix

#    0  1
# 0 55  9
# 1  4 32
