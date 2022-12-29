# 0 - Installing and Importing Libraries
install.packages('tidyverse')
install.packages(c('tidyverse', 'dslabs', 'dplyr', 'data.table'))

library('tidyverse')
library('dslabs')
library('dplyr')
library('data.table')

# 1 - Variables
#
# We can use both operators '=' and '<-' to assign 
# values to variables, and how the seecond one
# is most common in R, let's get used using it

a <- 1L              # integer
b <- 1               # float/numeric
c <- 1.0             # float/numeric
d <- 'Hello World'   # string/character
e <- TRUE            # boolean
f <- FALSE           # boolean

g <- NULL            # None/NULL
h <- pi              # constant: 3.14...
i <- Inf             # constant: infinite

# 2) If-Else Block
#
# We have three ways to use this block:
#
# - block
# - ternary
# - 'any' and 'all' functions
x <- 1:5

if (x[2] > 3) { print('GREATHER') }
else { print('SMALLER') }

ifelse(X[2] > 3, 'GREATHER', 'SMALLER')

any(x > 3) # TRUE
all(x > 3) # FALSE

# 3) For-Loop Block
for (element in x) { print(element) }

# 4) Functions
avg <- function(vector) { sum(vector) / length(vector) }

check_element <- function(vector, index, value) {
	ifelse(vector[index] > value, TRUE, FALSE)
}

# The 'identical' function compares if the returns
# of two functions or if the value and the data type
# of two variables are identical. If they are, then
# returns TRUE, else, FALSE
identical(avg(x), mean(x))

# The 'help' function is like the one present in
# Python, whereas the 'args' ones provides an
# explanation about the arguments/parameters
# that a function can hold
help(mean)
args(mean)