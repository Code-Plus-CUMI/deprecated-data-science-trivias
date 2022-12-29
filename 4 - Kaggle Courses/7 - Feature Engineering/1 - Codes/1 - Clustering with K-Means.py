"""
	K-Means Clustering

K-Means Clustering is a Non-Supervised Learning that
is applied to make the model finds patterns and
relationships (clusters) between the variables.

In Feature Engineering, the K-Means is applied to
create Sythetic Features (combinatioon of features)
adding a new column to the dataframe: the Cluster one!!
"""

# 0 - Reading the dataset and splitting up into #
# target and features #
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set_style('whitegrid')

df = pd.read_csv('filepath')
X = df.loc[:, ['Latitude', 'Longitude', 'MedInc']]
y = df.Price

# 1 - Checking out how many clusters is great #
# to the Clustering #
from sklearn.cluster import KMeans

wcss = []

# testing out with 1 to 11 clusters
for i in range(1, 11):

    # n_clusters >> number of clusters to be identified
    # max_iter   >> number of iterations for each run (n_init)
    # n_init     >> number of runs (centroids iteration)
    kmeans = KMeans(n_clusters=i, init='k-means++', max_iter=300, n_init=10, random_state=0)

    kmeans.fit(X)
    wcss.append(kmeans.inertia_)

# plotting the results (we often choose the amount
# of clusters where the WCSS starts to level off -
# elbow method)
plt.plot(range(1, 11), wcss)
plt.title('Elbow Method')
plt.xlabel('Number of clusters')
plt.ylabel('WCSS')
plt.show()

# 2 - Using K-Means (consider that 4 clusters #
# was the great amount and we will repeat the #
# K-Means centroids moviment 10 times) #
kmeans = KMeans(n_clusters=4, n_init=10)

X['Cluster'] = kmeans.fit_predict(X)
X['Cluster'] = X['Cluster'].astype('category')

# 3 - Plotting the Results
sns.relplot(
    x="Longitude", y="Latitude", hue="Cluster", data=X, height=6,
);