importDecisionTreeClassificationDataset <- function(decisionTreeClassificationDatasetFileName) {
  
  #importing dataset
  decisionTreeClassificationDataset = read.csv(decisionTreeClassificationDatasetFileName)
  
  #getting the required columns
  decisionTreeClassificationDataset = decisionTreeClassificationDataset[3:5]
  
  #encoding target feature as factor
  decisionTreeClassificationDataset$Purchased = factor(decisionTreeClassificationDataset$Purchased, levels = c(0, 1))
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  decisionTreeClassificationDatasetSlpit = sample.split(decisionTreeClassificationDataset$Purchased, SplitRatio = 0.75)
  
  decisionTreeClassificationTrainingSet = subset(decisionTreeClassificationDataset, decisionTreeClassificationDatasetSlpit == TRUE)
  
  decisionTreeClassificationTestingSet = subset(decisionTreeClassificationDataset, decisionTreeClassificationDatasetSlpit == FALSE)
  
  
  returnList <- list(decisionTreeClassificationTrainingSet, decisionTreeClassificationTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(decisionTreeClassificationTrainingSet, decisionTreeClassificationTestingSet){
  
  saveRDS(decisionTreeClassificationTrainingSet, file = "DecisionTreeClassificationTrainingSet.RDS")
  saveRDS(decisionTreeClassificationTestingSet, file = "DecisionTreeClassificationTestingSet.RDS")
  
}

#Save DecisionTreeClassification Model
saveDecisionTreeClassificationModel <- function(decisionTreeClassificationModel) {
  
  saveRDS(decisionTreeClassificationModel, file = "DecisionTreeClassificationModel.RDS")
}

#Save prediced values for testing set
saveDecisionTreeClassificationPredictedValuesForTestingSet <- function(decisionTreeClassificationPredictedValuesForTestingSet) {
  
  saveRDS(decisionTreeClassificationPredictedValuesForTestingSet, file = "DecisionTreeClassificationPredictedValuesForTestingSet.RDS")
}
