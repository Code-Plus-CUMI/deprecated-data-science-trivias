'''
0) Basic Elements

X >> features
x1,...,xn >> individual features (X e x1...xn)
y >> real outcomes/outputs
^y >> predicted outcomes/outputs

categorical predictions >> clusters/classifications
numerical predictions   >> regressions
'''

library(tidyverse)
library(caret)
library(dslabs)
data(heights)

# Defining the target and the feature #
y <- heights$sex
x <- heights$height

# Splitting target into train and test #
set.seed(2, sample.kind='Rounding')

# Returns the index of the test targets
#
# the 'p' parameter means how much percent
# of the data will be inclueded in the test
# dataset
test_index <- createDataPartition(y, times=1
                                 , p=0.2, list=FALSE)
test_data  <- heights[test_index,]
train_data <- heights[-test_index,]

# Guessing the Outcome (with random guesses, #
# without any 'intelligence') #
classes <- c('Male', 'Female')

predicted_y <- sample(classes
                    , length(test_index)
                    , replace=TRUE) %>% 
               factor(levels=levels(heights$sex))

# Calculating the Accuracy #
mean(predicted_y == test_data$sex)

'''
1) Confusion Matrix

Shows the amount of correct and the incorrect 
predictions of both classess.

Consider the following abbs:
      
      TP >> True Positive
      FP >> False Positive
      TN >> True Negative
      FN >> False Negative

1.1) Accuracy

It is the overall accuracy of the model:

      Acc = (TP + TN) / (TP + TN + FP + FN)

1.2) Sensivity

It is the accuracy of the Positive Class (the first
class to appear) considering the predictions:

      Sen = TP / (TP + FN)

1.3) Specifity

It is the accuracy of the Negative Class (the second
class to appear) considering the predictions:

      Spe = TN / (TN + FN)

1.4) Positive Prediction Value

It is the accuracy of the Positive Class considering
the real values:

      PDV = TP / (TP + FP)

1.5) Negative Prediction Value

It is the accuracy of the Negative Class considering
the real values:

      NPV = TN / (TN + FN)

-*-*-*-*-

The best part of all of this is that R calcs
all of this formulas automatically. You just have
to create a Confusion Matrix!!
'''
cm <- confusionMatrix(data=predicted_y
                    , reference=factor(test_data$sex))

'''
2) F-1 Score

F-1 Score is an unique value that summarizes
the Specifity and the Sensivity at the same time.

It is better to use rather than Confusion Matrix
when you are willing to consider Specifity and
Sensivity together.

When to consider both of them together? You will
know this by experience and feeling
'''
f_1 <- F_meas(data=predicted_y
            , reference=test_data$sex)


############

# Example - Creating a Linear Model to Predict
# Heights (as far as we are predicting values
# and not classes, there's no use to apply the
# Confusion Matrix here)

# Reading and Filtering the Dataset #
library(tidyverse)
library(HistData)

galton_heights <- GaltonFamilies %>%
                  filter(sex=='Male' & childNum==1) %>%
                  select(father, childHeight) %>%
                  rename(son=childHeight)

corr <- galton_heights %>%
        summarize(cor(son, father)) %>%
        pull()

# Splitting up the Dataset into Train and Validation #
library(caret)

y <- galton_heights$son

test_index <- createDataPartition(y, times=1
                                , p=0.5, list=FALSE)

train_data <- galton_heights %>% slice(-test_index)
valid_data <- galton_heights %>% slice(test_index)

# Creating, Fitting, Predicting 
# and Evaluating the Model #
fit <- lm(son~father, data=train_data)
fit$coef[1] # y-intercept
fit$coef[2] # slope

predicted_y <- fit$coef[1] + fit$coef[2] * valid_data$father
predict_y <- predict(fit, valid_data)
predict_y <- predict.lm(fit, valid_data)

mse <- mean((predicted_y - valid_data$son)^2)