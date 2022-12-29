"""
	Slope and Linear Plots

/ Use SLOPE/LINEAR PLOTS to compare the same variable in
two different times (years, months, weeks...). This
plot is like those ones we see in the elections

	Scatter Plots

/ The visualization of choice when exploring the 
relationship between two variables like home runs 
and runs is a SCATTERPLOT or Regression and LM Plots.

	Donut and Pie Plots VS Bar Plots

/ When creating pie/donut plots, always use the
same proportion of area to compare different plots.
But we still suggest replace pie/donut plots by
bar ones.

/ Avoid using PIE and DONUT PLOTS, use BAR PLOTS
instead


	Bar, Hist and Box Plots

/ Use Bar Plots to see the values, Box Plots
to see the variance and other statistical values 
and Hist Plots to see distributions.

/ Also, Box Plots are great to factor/categorical variables.

/ Bar and Hist plots should always start the y-axis 
from 0 in order to avoid 'manipulation/exageration' 
of the visualization. About the other plots, there
is no problem avoiding 0 in the y-axis

/ When it's difficult to identify the value in bar
plots, add labels showing the actual value for each
bar.
"""

"""
	Some Pro-Tips

/ Visual cues for encoding data include position, 
length, angle, area, brightness and color hue.

/ Reorder:
	- if the variable is string, reorder by the
	factor levels

	- if the variable is numerical, reorder by
	ascending or descending order (it's up to you)

/ Use Colors:

	- to compare different groups or hues (stratifications)

	- remember to pick up colors that are friendly
	to color blindness people (Pastel Palettes)

/ Consider Transformations:

	- Log Transformation: is useful for data with 
	multiplicative changes. 

	- Logistic Transformation: is useful for fold 
	changes in odds. 

	- Square Root Transformation: is useful for 
	count data.	

/ Comparing Graphs:

	- Axes: the x and y-axis should have the same
	range in both plots

	- Align: Vertically (to see horizontal changes)
	and Horizontally (to see vertical changes)

/ Avoid using 3D plots and use 2D ones instead

/ Avoid too many significant digits in dataframes
, series and plots. Try using 3 significant digits 
(decimal digits) instead
"""