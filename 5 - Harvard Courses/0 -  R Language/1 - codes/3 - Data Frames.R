# 0) Importing, Reading Dataset
# and Accessing Data #
library(dslabs)
data(murders)

murders # access all of the dataset
murders$column_1 # access a especific column
murders[[column_1]] # access a especific column
murders[index] # access a especific row

# 1) Creating Data Frames #
grades <- data.frame(names=c('Felix', 'Gui', 'Pedro')
					, exam_1=c(10, 10, 10)
					, exam_2=c(9.5, 8.8, 7.7)
					, stringAsFactors=FALSE)

# 2) Functions #
#
# \ class: returns the class of the object
# \ str: returns the structure (# rows, # columns)
# \ head: returns the first 6 rows
# \ names: returns thee column names
# \ nrow: returns the number of rows
# \ length: returns the number of columns
class(murders)
class(murders$population)
str(murders)
had(murders)
names(murders)
nrow(murders)
length(murders)

# \ levels: returns all the factor values
# \ nlevels: returns the number of factor values
levels(murders$region)
nlevels(murders$region)

# \ min, max: returns the min and max values
# \ which.min, which.max: returns the index
min(murders$population) # returns value
max(murders$population) # returns value
which.min(murders$population) # returns index
which.max(murders$population) # returns index

# \ is.na: retuns a vector wich boolean values,
# TRUE if the element is NA, FALSE, if it's not
# \ mean: calculates the arithmeric mean
# \ median: calculates the median
# \ sd: calculates the standard deviation
# \ sum: sums values
is.na(murders$state)
mean(murders$population)
median(murders$population)
sd(murders$population)
sum(murders$population)

# \ which: returns the index of a single value
# \ match: returns the indexes of a vector of values
# \ %in%: returns if values are in a column
index_1 <- which(murders$state == 'Massachusetts')
index_2 <- match(c('New York', 'Florida', 'Texas'), murders$state)
index_3 <- c('Boston', 'Dakota', 'Washington') %in% murders$state

# 3) Mutate, Filter, Select, Summarize, 
# Pull, Group By and Arrange #
#
# \ Mutate: adds a new column into the dataframe
# \ Filter: filters rows
# \ Select: returns some columns
murders <- mutate(murders, rate=total/population*10^5)
new_df <- filter(rate <= 0.71)
new_df <- select(new_df, state, region, rate)

new_df <- murders %>% mutate(rate=total/population*10^5)
                  %>% select(state, region, rate)
                  %>% filter(rate <= 0.71)

# \ Summarize: create new data frames from another 
# ones applying some functions, such as median, 
# mean, max, min and so on.
values <- murders %>% filter(region == 'Northeast')
                  %>% summarize(min_value=min(rate)
                  			  , median_value=median(rate)
                  			  , max_value=max(rate))

values$min_value
values$median_value
values$max_value

values <- murders %>% filter(region == 'Northeast')
                  %>% summarize(rate=quantile(c(0, 0.5, 1)))

values$rate

# \ Pull: all 'summarize' results are in 'dataframe'
# data type, so, if we wanna get a numeric result, 
# we have to use the 'pull' function like this or 
# the dot accessor
values <- murders %>% filter(region == 'Northeast')
				  %>% summarize(rate=quantile(c(0, 0.5, 1)))
				  %>% pull(rate)

values <- murders %>% filter(region == 'Northeast')
				  %>% summarize(rate=quantile(c(0, 0.5, 1)))
				  %>% .$rate

# \ Group By: calculates by groups
# \ Arrange: sort the whole dataframe by columns
mean_per_region <- murders %>% group_by(region)
						   %>% summarize(mean=mean(rate))

top_10_bigger <- murders %>% arrange(rate, population)
						 %>% top_n(10)

top_10_smaller <- murders %>% arrange(desc(rate, population))
						  %>% top_n(10)