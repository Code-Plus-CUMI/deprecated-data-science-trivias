#	*******************************
#	* Advanced Statistic Analysis *
#	*******************************

"""
To perform an advanced statistical analysis of a dataframe called "df" with
numerical and categorical features in Python, you can use the following steps:

- Import the necessary libraries, such as Pandas, NumPy, SciPy, and statsmodels;
- Use the describe() function to generate summary statistics for all numerical
columns in the dataframe;
- Use the value_counts() function to generate a frequency count for all
categorical columns in the dataframe;
- Use the groupby() function to generate statistics for specific combinations
of categorical columns and numerical columns;
- Use the pandas corr() function to compute pairwise correlation of columns,
excluding NA/null values;
- Use the chi-squared test of independence to test for association between
categorical columns;
- Use a t-test or ANOVA to test for differences in means between groups
defined by categorical columns;
- Use regression analysis to model the relationship between numerical
columns and a categorical or numerical target column;
- Use machine learning models such as decision tree, random forest, or neural
network to predict a target column based on the other columns in the dataframe;
- Visualize the data using Matplotlib or Seaborn library to get a better
understanding of the distribution of the data and relationships between
variables.
"""

# Step 1: Import the necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from autoviz.AutoViz_Class import AutoViz_Class
from scipy.stats import chi2_contingency, ttest_ind, f_oneway
import statsmodels.formula.api as smf
from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeRegressor

# Step 2: Generate summary statistics for numerical columns
print(df.describe())

auto_viz = AutoViz_Class()
filename = 'any_file.csv'
sep = ','

graph = df.AutoViz(
    filename
    , sep=','
    , depVar=''
    , dfte=None
    , header=0
    , verbose=0
    , lowess=False
    , chart_format='svg'
    , max_rows_analyzed=150000
    , max_cols_analyzed=30
)

# Step 3: Generate frequency count for categorical columns
for col in df.columns:
    if df[col].dtype == 'object':
        print(df[col].value_counts())

sns.countplot(x='reputation', data=df)
sns.barplot(x=df.reputation.value_counts().index, y=df.reputation.value_counts())

# Step 4: Generate statistics for specific combinations of columns
print(df.groupby(['categorical_col1', 'categorical_col2'])['numerical_col'].mean())

# Step 5: Compute pairwise correlation of columns
corr = df.corr()
print(corr)
sns.heatmap(corr, vmax=1, annot=True, linewidths=.5)

# Bonus Step 1: null values and plot

# Step 6: Chi-squared test of independence (can just be used for categorical variables)
# p-values less than 5% proves that the Null Hypothesis is false
crosstab = pd.crosstab(df['categorical_col1'], df['categorical_col2'])
chi2, p, dof, expected = chi2_contingency(crosstab)
print("Chi-squared test of independence: p-value =", p)

# Step 7: t-test or ANOVA (if the sample has more than 30k rows, use
# z-test over t-test)
# p-values less than 5% proves that the Null Hypothesis is false
group1 = df[df['categorical_col'] == 'group1']['numerical_col']
group2 = df[df['categorical_col'] == 'group2']['numerical_col']
group3 = df[df['categorical_col'] == 'group3']['numerical_col']

t_stat, t_pvalue = ttest_ind(group1, group2)
F, F_pvalue = f_oneway(group1, group2, group3)

print(f't-test: p-value = {t_pvalue}')
print(f'anova-test: p-value = {F_pvalue}')


stat, p = stats.ttest_ind(df['numerical_col1'], df['numerical_col2'])
print(f'Statistics={stat:.3f}, p={p:.3f}')
stat, p = stats.f_oneway(df['numerical_col1'], df['numerical_col2'], df['numerical_col3'])
print(f'Statistics={stat:.3f}, p={p:.3f}')


# Step 8: Regression analysis
model = smf.ols(formula='numerical_col ~ categorical_col', data=df).fit()
print(model.summary())

"""
The summary() method of the results object returned by the fit() function 
in the code you provided returns a summary of the linear regression model fit,
including the following:

- coef: The estimated coefficients for the variables in the model. These are
the values that are used to define the line of best fit. The coefficients
represent the change in the dependent variable for a one-unit change in the
independent variable, holding all other variables constant.

- std err : The standard error of the coefficients. This is a measure of
the accuracy of the coefficient estimates. Smaller values indicate more
accurate estimates.

- t : The t-statistics for the coefficients. These test the null hypothesis
that the coefficient is equal to zero, which corresponds to no effect of the
variable on the response. The p-value associated with the t-statistic can be
used to determine the significance of the coefficient.

- P>|t| : The p-value associated with the t-statistics. A small p-value 
(typically less than 0.05) indicates that there is strong evidence against
the null hypothesis and that the variable has a significant effect on the
response.

- R-squared: The coefficient of determination. This is a measure of how
well the independent variable(s) in the model explain the variation in the
dependent variable. A value of 1 indicates that the independent variable(s)
perfectly explain the variation in the dependent variable, while a value of
0 indicates that the independent variable(s) have no effect on the dependent
variable.

- Adjusted R-squared: The adjusted R-squared adjusts for the number of
variables in the model. It is a modified version of R-squared that has
been adjusted for the number of predictors in the model. It gives an idea
of the goodness of fit of a model.

- F-statistic and Prob (F-statistic) : The F-statistic tests the overall
significance of the model, which is the null hypothesis that all coefficients
are equal to zero. The Prob (F-statistic) is the associated p-value.

- Log-Likelihood: The log-likelihood of the fitted model.

- AIC and BIC : The Akaike information criterion (AIC) and Bayesian
information criterion (BIC) are measures of the relative quality of a
statistical model, they are based on the likelihood function. Lower
values indicate a better model fit.
"""

# Bonus Step 2: pandas profiling report