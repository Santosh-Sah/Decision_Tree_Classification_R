source("DecisionTreeClassificationUtils.R")

decisionTreeClassificationDatasetList <- importDecisionTreeClassificationDataset("Decision_Tree_Classification_Social_Network_Ads.csv")

saveTrainingAndTestingDataset(decisionTreeClassificationDatasetList[[1]], decisionTreeClassificationDatasetList[[2]])
