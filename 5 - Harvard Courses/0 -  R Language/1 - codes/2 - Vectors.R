# 0) Creating Vectors #
#
# Reminder: R doesn't have different data types
# to storage a group of datas like in Python (
# lists, dictionaries and sets). In R, we
# have just the vectors!!!!!!

# Like 'Lists' in Python
codes <- c(358, 321, 326)
countries <- c('italy', 'brazil', 'usa')
empty_vector = vector('numeric', 25) # 25 numeric slots

# Like 'Dictionaries' in Python
names(codes) <- countries
codes <- c('italy'=358, 'brazil'=321, 'usa'=326)
codes <- c(italy=358, brazil=321, usa=326)

# Like the 'Range' in Python
sequence_1 <- 1:10                     # 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
sequence_2 <- seq(1, 10, 2)            # 1, 3, 5, 7, 9
sequence_3 <- seq(1, 10, length.out=4) # 1, 4, 7, 10

# 1) Accessing Datas #
codes
codes[1] # vectors start from 1 in R '-'
codes[c(1,3)] # returns the first and the third elements
codes['italy']
codes[c('italy', 'usa')]

# 2) Data Coercion #
# R provides Data Coercion, which means, when a
# variable is assigned with a vector with
# different data types, R tries to convert them
# to just one. For instance:
x <- c(1, 'italy', 3) # '1', 'italy', '3'

# Also, we can use 'as.character' and 'as.numeric'
# to convert numbers into strings and strings into
# numbers respectively
a <- 1:5              # 1, 2, 3, 4, 5
a <- as.character(a)  # '1', '2', '3', '4', '5'
a <- as.numeric(a)    # 1, 2, 3, 4, 5

x <- as.numeric(x)    # 1, NA, 3
# the 'NA' means 'Not Available'. It means that
# it's not possible to convert 'italy' value to
# numeric, so we got a missing value

# 3) Some Functions #
#
# \ sort: sorts the vector's elements
# \ order: sorts the index of the vector's elements
# \ rank: shows the position of the eleement if used the 'sort' function
x <- c(31, 2, 15, 45)

sort(x)   # 2, 15, 31, 45
order(x)  # 2,  3,  1,  4
rank(x)   # 3,  1,  2,  4

# \ min, max: returns the min and max values
# \ which.min, which.max: returns the index of the
# min and max values
min(x)        # element: 2
max(x)        # element: 45
which.min(x)  # index: 2
which.max(x)  # index: 4