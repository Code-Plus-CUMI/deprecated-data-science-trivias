'''
	The Baseline

That’s why you need a baseline. A baseline is a 
reference from which you can compare algorithms. 
The notion of good or bad can only be applied if 
we have a comparison basis.

In order to create a baseline, you will do exactly
what I did above: select the class with most 
observations in your data set and ‘predict’ 
everything as this class. Then, you will find out 
what would be your accuracy if you didn’t use any 
model.

Class-balanced data sets will have a baseline of 
more or less 50%. But the vast majority of data 
sets are not balanced. And even when they are, 
it’s still important to calculate which observations
are more present on the set.

If your accuracy is not very different from your 
baseline, it’s maybe time to consider collecting 
more data, changing the algorithm or tweaking it. 
Or maybe you just have a very hard, resistant to 
prediction problem.
'''