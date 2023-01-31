#   ****************************
#   * Basic Statistic Analysis *
#   ****************************

"""
To perform a statistical analysis of a dataframe called "df" with numerical
and categorical features in Python, you can use the following steps:

- Import the necessary libraries, such as Pandas and NumPy;
- Use the describe() function to generate summary statistics for all numerical
columns in the dataframe;
- Use the value_counts() function to generate a frequency count for all
categorical columns in the dataframe;
- Use the groupby() function to generate statistics for specific combinations
of categorical columns and numerical columns;
- Use the pandas corr() function to compute pairwise correlation of columns,
excluding NA/null values;
- Visualize the data using Matplotlib or Seaborn library to get a better
understanding of the distribution of the data.
"""

# Step 1: Import the necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Step 2: Generate summary statistics for numerical columns
print(df.describe())

# Step 3: Generate frequency count for categorical columns
for col in df.columns:
    if df[col].dtype == 'object':
        print(df[col].value_counts())

# Step 4: Generate statistics for specific combinations of columns
print(df.groupby(['categorical_col1', 'categorical_col2'])['numerical_col'].mean())

# Step 5: Compute pairwise correlation of columns
print(df.corr())

# Step 6: Visualize the data
df.plot(kind='scatter', x='numerical_col1', y='numerical_col2')
plt.show()