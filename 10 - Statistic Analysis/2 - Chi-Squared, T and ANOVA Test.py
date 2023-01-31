# ** Chi-Squared Test **

"""
The chi-squared test of independence is a statistical test used to determine
if there is a significant association between two categorical variables.
It is also known as Pearson's chi-squared test. The test is based on the
chi-squared statistic, which measures the difference between the observed
and expected frequencies of the variables in a contingency table.

The chi-squared test of independence can be used to answer the following
question: Is there a significant association between variable A and variable
B? The test assumes that the two variables are independent, and if there is
a significant association between the two variables, it can be concluded that
they are not independent.

To perform a chi-squared test of independence in Python, you can use the
chi2_contingency() function from the scipy.stats library. This function
takes in a contingency table, which is a table that shows the frequencies
of the variables in a cross-tabulation format. The function returns four
values: the chi-squared statistic, the p-value, the degrees of freedom,
and the expected frequencies.
"""

"""
In this example, df is the dataframe that contains the data for the
analysis. variable_a and variable_b are the two categorical variables
that you want to test for independence. The pd.crosstab() function is
used to create a contingency table, and the chi2_contingency() function
is used to perform the chi-squared test of independence. The p-value is
the probability of observing the current dataset or an even more extreme
dataset if the null hypothesis is true. It is used to determine the
significance of the association between the two variables. Typically,
a p-value of less than 0.05 is considered to be statistically significant.
"""


from scipy.stats import chi2_contingency

# Create a contingency table
crosstab = pd.crosstab(df['variable_a'], df['variable_b'])

# Perform the chi-squared test of independence
chi2, p, dof, expected = chi2_contingency(crosstab)

# Print the results
print("Chi-squared test of independence: p-value =", p)





"""
A t-test is a statistical test that is used to determine if there
is a significant difference between the means of two groups. There
are different types of t-tests, such as the one-sample t-test, the
independent samples t-test (also known as a two-sample t-test), and
the paired samples t-test. The t-test assumes that the data is normally
distributed, and it is based on the t-statistic, which measures the
difference between the sample mean and the population mean, in units
of the sample standard deviation.

An ANOVA (analysis of variance) is a statistical test that is used
to determine if there is a significant difference between the means
of three or more groups. ANOVA is an extension of the t-test for comparing
means of more than two groups. The ANOVA test is based on the F-statistic,
which measures the ratio of the variance between the groups to the variance
within the groups.
"""

# T-Test
from scipy.stats import ttest_ind

# Define the data for the two groups
group1 = df[df['group'] == 'A']['numerical_col']
group2 = df[df['group'] == 'B']['numerical_col']

# Perform the t-test
t, p = ttest_ind(group1, group2)

# Print the results
print("Independent samples t-test: t = %.3f, p = %.3f" % (t, p))

# ANOVA
from scipy.stats import f_oneway

# Define the data for the groups
group1 = df[df['group'] == 'A']['numerical_col']
group2 = df[df['group'] == 'B']['numerical_col']
group3 = df[df['group'] == 'C']['numerical_col']

# Perform the ANOVA test
F, p = f_oneway(group1, group2, group3)

# Print the results
print("One-way ANOVA: F = %.3f, p = %.3f" % (F, p))