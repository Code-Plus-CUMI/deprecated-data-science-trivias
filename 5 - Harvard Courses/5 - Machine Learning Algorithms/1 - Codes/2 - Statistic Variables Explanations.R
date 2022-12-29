## Call:
## lm(formula = dist ~ speed.c, data = cars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -29.069  -9.525  -2.272   9.215  43.201 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  42.9800     2.1750  19.761  < 2e-16 ***
## speed.c       3.9324     0.4155   9.464 1.49e-12 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.38 on 48 degrees of freedom
## Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
## F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12

"""
/ Call: the variables applied in the calculations

/ Residuals: the Residuals' Percentiles

/ Coefficients:

	- Estimate: the y-intercept and the slope
	- Std. Error: the error margin for the Estimate Std
	- T-Value: the amount of Standard Deviations that
the Estimate Std are far away from 0. As higher the value
as better it'll be (we can discard the Null Hypothesis)
	- Pr(>|t|): the relationship level of the two variables.
Three star is strong, two's kinda, one's weak and so on.

/ Residual Standard Error: it's the QUALITY of the Linear Regression.
It's the average amount that the response (y) will deviate from
the true Regression Line. It's shown as a number but you can
calculate it as a percentage like bellow:

	Percentage = Residual Standard Error * 100 / Estimate (y-intercept)

/ Multiple R-Squared and Adjusted R-Squared: they are values
that go from 0 to 1 and represent as much percent the feature
(x) explains the response (y). As to close to 0, we can assume
that there are no relationship between the variables,
and as close to 1, there are.

/ F-Statistic: it's a good indicator of whether there 
is a relationship between our predictor and the 
response variables. The further the F-statistic is 
from 1 the better it is. However, how much larger 
the F-statistic needs to be depends on both the 
number of data points and the number of predictors. 
Generally, when the number of data points is large,
an F-statistic that is only a little bit larger 
than 1 is already sufficient to reject the Null 
Hypothesis (H0 : There is no relationship between 
speed and distance). The reverse is true as if the 
number of data points is small, a large F-statistic 
is required to be able to ascertain that there may 
be a relationship between predictor and response 
variables. 

In our example the F-statistic is 89.5671065 which 
is relatively larger than 1 given the size of our 
data.
"""