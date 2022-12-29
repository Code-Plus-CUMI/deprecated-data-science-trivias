library(dplyr)

# 0 - Joins Functions
#
# left_join()  :  only keeps rows that have information in the first table.
# right_join() :  only keeps rows that have information in the second table.
# inner_join() :  only keeps rows that have information in both tables.
# full_join()  :  keeps all rows from both tables.
# semi_join()  :  keeps the part of first table for which we have information in the second.
# anti_join()  :  keeps the elements of the first table for which there is no information in the second.

# 1 - Bind Functions
#
# bind_cols()  : binds two columns and returns a tibble
# cbind()      : binds two columns and returns a dataframe/object
# bind_rows()  : binds two rows and returns a tibble
# rbind()      : binds two rows and returns a dataframe/object

# 2 - Sets
#
# intersect()  : returns the AND
# union()      : returns the OR
# setdiff()    : returns the elements that are in 'a' but not in 'b'
# setequal()   : returns if two sets are identical or not, regardless the order of the elements
a <- c(1, 2, 3)
b <- c(3, 4, 5)
c <- c(2, 3, 1)

intersect(a, b) # c(3)
union(a, b)     # c(1, 2, 3, 4, 5) 
setdiff(a, b)   # c(1, 2)
setdiff(b, a)   # c(4, 5)
setequal(a, b)  # FALSE
setequal(a, c)  # TRUE