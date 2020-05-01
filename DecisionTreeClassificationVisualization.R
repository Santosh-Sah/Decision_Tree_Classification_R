source("DecisionTreeClassificationUtils.R")
library(rpart)
library(ggplot2)
library(ElemStatLearn)

#reading training set 
decisionTreeClassificationTrainingSet <- readRDS("DecisionTreeClassificationTrainingSet.RDS")

#reading testing set data
decisionTreeClassificationTestingSet <- readRDS("DecisionTreeClassificationTestingSet.RDS")

#reading DecisionTreeClassification model
decisionTreeClassificationModel = readRDS("DecisionTreeClassificationModel.RDS")

#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(decisionTreeClassificationTrainingSet, decisionTreeClassificationModel){
  
  set = decisionTreeClassificationTrainingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.5)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.5)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_set = predict(decisionTreeClassificationModel, newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  plot(set[, -3],
       main = 'Decision Tree Classification (Training set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("DecisionTreeClassificationTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(decisionTreeClassificationTestingSet, decisionTreeClassificationModel){
  
  set = decisionTreeClassificationTestingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_set = predict(decisionTreeClassificationModel, newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  plot(set[, -3],
       main = 'Decision Tree Classification (Test set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("DecisionTreeClassificationTestingsetResult.png")
  
}

#visualisingTrainingSetResult(decisionTreeClassificationTrainingSet, decisionTreeClassificationModel)
#visualisingTestingSetResult(decisionTreeClassificationTestingSet, decisionTreeClassificationModel)

# Plotting the tree
png('DecisionTreeClassification.png')
plot(decisionTreeClassificationModel)
text(decisionTreeClassificationModel)
dev.off()
