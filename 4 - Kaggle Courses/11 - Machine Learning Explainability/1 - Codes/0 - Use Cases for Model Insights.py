"""
	Use Cases for Model Insigths

Before creating and training the ML Model, you
gotta know well the features, especially the 
FEATURES IMPORTANCE.

Which means, you gotta make transformations (feature
engineering), filter them (data leakage and
importance) and make processes with pipelines.

So, let's dive into some aspects to have in mind:
"""

"""
	1 - Data Leakage

/ Train-Test Contamination:

Always split the datas into train and validation
before applying the pipelines (imputation, encoding,
standardization...)

/ Target Leakage:

Drop features which have their values assigned
after the target's values is known
"""

"""
	2 - Missing Values

/ Missing Values:

You gotta think: are the values missing because
they weren't found/collected or because they don't
even exist? 

If they don't even exist, is it right to impute 
them with the AVG? Or would it be better impute 
them with the minimum value, like zero?

	3 - Imputation Importance (WHAT features are important)

- The model must be already fit

- We shuffle just one feature from the validation
dataset

- We make predictions with the result dataset and 
check out whether we got better results or not. If 
the loss has been increased, it means that the 
feature is important; else, the feature is not so 
much important

- The results are like the bellow:

	   a  +-   b     |      c
	0.145 +- 0.5823  | Feature's Name

a >> the loss metric value (accuracy)
b >> the variation
c >> feature's name

We got the variation ('b') because the model
predicts shuffling the same column multiple times.

As far it's common to get different loss values for
each shuffling, then the variation shows how much
has the loss variated in general for each shuffling.

-*-*-*-*-

** Key **

/ Other important thing to do is create new features,
like, if we have 'initial_longitude/latitude' and
'final_longitude/latitude', we can create two new
features: 'abs_longitude' and 'abs_latitude'
representing the distance between the locations
"""

import eli5
from eli5.sklearn import PermutationImportance

feature_names = [col for col in X_val.columns
				 if X_val[col].dtype in [np.int64]]

perm = PermutationImportance(model, random_state=1).fit(X_val, y_val)
eli5.show_weights(perm, feature_names=feature_names)

"""
	4 - Partial Dependence Plots (HOW the features are important)

/ the model must be already fit

/ the logic is almost the same of the Permutation
Importance, but instead of shuffling a feature,
the model changes the values of a single feature
in the rows in order to checks out the changes
in the target

/ with this, we can know the relationship between
feature and target

** KEY **

/ if the target changes a lot, it means that the
feature is important, else, the feature is not
(it's great to have in mind because after making
new features with engineering, some important
features can become worthless later)
"""
import matplotlib.pyplot as plt
from pdpbox import pdp, get_dataset, info_plots

# Getting the Features#
feature_names = [col for col in val_X.columns
				 if val_X[col].dtype in [np.int64]]

feature_to_plot_1 = 'Goal Scored'
feature_to_plot_2 = 'Distance Covered (kms)'

# Getting the Partial Dependence of
# 'Goals Scored' Feature
pdp_goals = pdp.pdp_isolate(model=model_1
							, dataset=val_X
							, model_features=feature_names
							, feature=feature_to_plot_1)

# Linear Result >> see image 1
pdp.pdp_plot(pdp_goals, feature_to_plot_1)

# Getting the Partial Dependence of
# 'Distance Covered (kms)' Feature
pdp_dist = pdp.pdp_isolate(model=model_2
						   , dataset=val_X
						   , model_features=feature_names
						   , feature=feature_to_plot_2)


# Non-Linear Result >> see image 1.1
pdp.pdp_plot(pdp_dist, feature_to_plot_2)

###########

# Example with 2D Partial Dependence Plot

feature_names = [col for col in val_X.columns
				 if val_X[col].dtype in [np.int64]]
features_to_plot = ['Goals Scored', 'Distance Covered (kms)']


inter_goals_dist = pdp.pdp_interact(model=model_1
									, dataset=val_X
									, model_features=feature_names
									, features=features_to_plot)

pdp.pdp_interact_plot(pdp_interact_out=inter_goals_dist
					  , feature_names=features_to_plot
					  , plot_type='contour')
plt.show()


"""
	5 - SHAP Values

SHAP Values are used to compare a prediction if
a feature has a certain value given a baseline
value. In a nutshell, the SHAP equation 
is as follows:

	sum(SHAP values for all features) = pred_for_team - pred_for_baseline_values

/ pred_for_team              >> the assumed values
/ pred_foor_baseline_values  >> the base values

-*-*-*-*-

For instance, if we were checking out the
probability of a team gets a player winning the
'Man of the Match' award, we could ask:

	"How much was a prediction driven by the fact
			that the team scored 3 goals?"

However, the SHAP technique utilizes a base value
in the comparison. So. it's get easier if we ask:

	"How much was a prediction driven by the fact
	that the team scored 3 goals, instead of 2
	(or another baseline number of goals) goals?"

Of course, each team has many features. So if we 
answer this question for number of goals, we 
could repeat the process for all other features.

-*-*-*-*-

In the example bellow, we will be using just a
single row from the validation dataset, however
we can use as many rows as we'd like, even the
entirely dataset.
"""

# Raw Prediction #
row_to_show = 5 # row of index 5
data_for_prediction = val_X.iloc[row_to_show]
data_for_prediction_array = data_for_prediction.values.reshape(1, -1)

model_1.predict_proba(data_for_prediction_array)
# > array([[0.29, 0.71]])
#
# 71% of the team has a player winning the 'Man of the Match' award
# 29% of the team hasn't

# Calculating the SHAP #
import shap

explainer = shap.TreeExplainer(model_1)
shap_values = explainer.shap_values(data_for_prediction)

# Plotting the SHAP with the Baseline Values #
#
# In this case, we select the second element
# (index 1) of 'explainer.expected_values' and
# 'shap_values' in order to consider just the
# positive outcome, that is, the probability
# of a team has a player winning the 'Man of
# the Match' award
shap.initjs()
shap.force_plot(explainer.expected_value[1]
				, shap_values[1]
				, data_for_prediction)

"""
	** KEY **

If you look carefully at the code where we 
created the SHAP values, you'll notice we 
reference Trees in shap.TreeExplainer(my_model). 
But the SHAP package has explainers for every 
type of model, such as:

	/ shap.DeepExplainer: works with Deep 
	Learning models;
	
	/ shap.KernelExplainer: works with all models, 
	though it is slower than other Explainers and 
	it offers an approximation rather than exact 
	Shap values;

	/ and so on.
"""

#######

"""
More examples with SHAP Values, but using all
of the validation dataset now
"""

import shap

# 1 - Summary Plot
explainer = shap.TreeExplainer(my_model)
shap_values = explainer.shap_values(val_X)
shap.summary_plot(shap_values[1], val_X)

# 2 - Dependence Plot
explainer = shap.TreeExplainer(my_model)
shap_values = explainer.shap_values(X)
shap.dependence_plot('Ball Possession %', shap_values[1], X, interaction_index="Goal Scored")