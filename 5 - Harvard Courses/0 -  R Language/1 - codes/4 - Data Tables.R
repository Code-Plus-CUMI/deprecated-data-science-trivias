library(tidyverse)
library(dplyr)
library(dslabs)
data(murders)

# 0) Installing and Importing the 
# Data.Table Library #
install.package(data.table)
library(data.table)

# 1) Converting Data Frames into Data Tables
# and Copying them to New Variables #
murders <- setDT(murders)
murders_copy <- copy(murders)

# 2) Mutate, Filter, Select, Summarize, Sort

# Mutate > Adding New Columns
murders[, rate:=total/population*10^5]
murders[, ':=' rate=total/population*10^5, rank=rank(population)]

# Filter > Filtering Rows
murders[rate <= 0.71]
murders[rate <= 0.71, .('state', 'rate')] # filter and seelect in one command

# Select >> Filtering Columns
murders[, c('state', 'rate')]
murders[, c('state', 'rate')] |> head() # returns the first 6 rows

# Summarize >> Calculating Stats
murders[, .(average=mean(rate), std=sd(rate))]

murders[region == 'Northeast'
		, average=mean(rate), std=sd(rate)]

murders[region == 'Northeast'
		, average=mean(rate), std=sd(rate)
		, by=population] # with group by

# Sort > Sorting...
murders[order(rate)]
murders[order(rate, population)]
murders[order(rate, population, decreasing=TRUE)]