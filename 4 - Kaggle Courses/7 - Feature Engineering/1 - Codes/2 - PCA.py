"""
	Principal Component Analysis (PCA)

The PCA is applyed when we have a bunch of features
in our dataset and, in order to reduce the amount of them
and get better results in our predictions, we apply the
technique to select just the most appropriate features.

With this, we can say that the PCA alters the 
'dimensionality/shape' of the inputs.

Before to apply the PCA technique, the datas should
be standardized (RobustScale, MinMaxScaler, 
StandardScaler or Normalization)

And, this technique often loses part of the original
information, so, in order to know the % of the loss,
call the 'explained_variance_ratio' property of the PCA

Also, we gotta use this technique AFTER splitting the
features into train and validation.
"""

# 0 - Reading the Dataframe and Spliting up the Target #
# from the  #
import pandas as pd

df = pd.read_csv('filepath')

X = df.copy()
y = X.pop['target']

# 1 - Scaling the Features with Standard Scaler #
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
X = scaler.fit_transform(X)

# 2 - Using PCA to alter the dimensionality of the
# features #
from sklearn.decomposition import PCA

# we will alter the shape to two dimensions (
# n_components=2)
pca = PCA(n_components=2)

pca_components = pca.fit_transform(x)

# we wil use the 'pca_df' instead of the X
# to train and valid the model
pca_df = pd.DataFrame(data=pca_components
					, columns=['Component 1'
							 , 'Component 2'])

# 3 - Checking out the Variance Ratio #
# (how many % of the information was preserved) #
pca.explained_variance_ratio
#
# > Principal Component 1: 72.77%
# > Principal Component 2: 23.03%
# > Total: 95.80%
# > Information Loss: 4.20%