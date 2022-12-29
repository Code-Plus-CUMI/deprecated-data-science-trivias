"""
	Mutual Information - Feature Utility Metric

	Mutual Information (MI) is one of the Feature Utility
Metric (FUM) that is applied to check out if a feature gives
good information to the model predicts the target values and
to rank the features (from the most informative to the less one).

	In a nutshell, the MI calculates how much uncertainty
the model would be if it received this feature in the training.

	If the MI is close to 0, it means that the feature is not
good to be used in the training, because there is no relationship
between the feature and the target.

	Besides, the MI just consider the features in a independent way,
which means, the same features that don't have a relationship with
the target, could have the relationship when applied together (
creating Synthetic Features).

	Relationships-wise, MI can identify every single one, and not
just Linear Relationships. And you have to identify if the features
are Discrete or Not Discrete when using this technique:

		Discrete >> object and categorical dtypes (you gotta encode
		the features before getting the MI score)

		Not Discrete >> float and int dtypes
"""

# 0 - Importing the libraries and reading the dataset
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import pandas as pd

np.random.seed(0)
sns.style('whitegrid')

df = pd.read_csv('filepath')

# 1 - Getting the features and target variables and
# splitting the features into discrete and not discrete

X = df.copy()
y = X.pop('Price')

"""
All preprocessing and transformation process fit over here!!
Like Encoding, Imputation, Scaler and so on.
[...]
With everything done, we can split the features into discrete
and not discrete ones.
"""

discrete_features = X.dtypes == int

# 2 - Getting the MI Scores

# MI Score for Discrete Features (Real Valued)
from sklearn.feature_selection import mutual_info_regression

# MI Score for Noot Discrete Features (Categorical)
from sklearn.feature_selection import mutual_info_classif

def get_mi_scores(X, y, discrete_features):
	"""
	Calculates the MI Score of the discrete features from
	a dataframe.

	After that, the socres are transformed into a Series
	and sorted in descending order.
	"""
	mi_scores = mutual_info_regression(X, y
							, discrete_features=discrete_features)

	mi_scores = pd.Series(mi_scores
					     , index=X.columns
					     , name='MI Scores')

	mi_scores = mi_scores.sort_values(ascending=False)

	return mi_scores

mi_scores = get_mi_scores(X, y, discrete_variables)	
mi_scores

# 3 - Displaying the Results with Data Visualization

def plot_mi_scores(scores):
	scores = scores.sort_values(ascending=True)
	width = np.arange(len(scores))
	ticks = list(scores.index)
	plt.barh(width, scores)
	plt.yticks(width, ticks)
	plt.title("Mutual Information Scores")

plt.figure(dpi=100, figsize=(10,7))
plot_mi_scores(mi_scores)