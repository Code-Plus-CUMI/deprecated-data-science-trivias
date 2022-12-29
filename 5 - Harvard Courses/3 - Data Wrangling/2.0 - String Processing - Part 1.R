library(tidyverse) # stringr package
library(stringr)

my_string <- c('4,567,123', '456,784', '45')

# 0 - Some Functions
#
# str_detect()      : checks out if the strings have a certain pattern
# str_replace_all() : removes a certain pattern from a string
# parse_number()    : removes characters from numbers and convert them into numericals (integers or floats)
str_detect(my_string, ',') # TRUE TRUE FALSE
str_replace_all(my_string, ',', '') # '4567123 456784 45'
parse_number(my_string) # '4567123 456784 45'

# 1 - RegEx
#
# |                       >>  OR operator
# \d                      >>  any digits (0-9)
# \s                      >>  space
# [0-9]                   >>  same as \d
# [a-z], [A-Z], [a-zA-Z]  >>  lower and upper case letters
str_detect(my_string, 'e|i') # checks out if the string has 'e' or 'i'
str_detect(my_string, '\\d') # checks out if the string has any digits
str_detect(my_string, '[0-9]') # checks out if the string has any digits
str_detect(my_string, '[a-zA-Z]') # checks out if the string has any lower or upper case letters

str_view(my_string, 'e|i') # returns thee first match
str_view_all(my_string, 'e|i') # returns all the matches
str_replace(my_string, 'ft|foot|feet', '\'') # replaces characters to another ones

# ^ >> start of the string
# $ >> end of the string
# * >> zero or more repetitions
# + >> one or more repetitions
# ? >> zero or one repetition
my_string <- c('AB', 'A1B', 'A11B', 'A111B')

# checks out if the string starts with '1' or '2'
# followed by the letter 'm' and on or two digits
# followed by 'cm', and the meters are separated
# by a space from thee 'cm'.
# Which means, it checks out whether the string 
# is a height in meters format
str_detect(my_string, '^[1-2]m\\s\\d{1,2}cm$')


# separate() >> separates strings
# split()    >> split a string to a vector
#
# recode()   >> replaces strings to another ones
# the diffeerence between replace is that we can
# replace multiple strings with different strings
# simultaneously
my_string     <- c('5\' 11', '6\' 20', '5\'')
my_new_string <- '5\' 11, 6\' 20, 5\''
countries     <- c('United States of America'
				 , 'Trinidad and Tobago'
				 , 'St. Vincent and the Grenadines')

separate(my_string, c('ft', 'in')
	   , sep=',', fill='right') # 5ft 11in, 6ft 20in, 5ft 00in
split(my_new_string, ',') # c('5\' 11', '6\' 20', '5\'')

recode(countries
	, 'United States of America'        = 'USA'
	, 'Trinidad and Tobago'             = 'Trinidad'
	, 'St. Vincent and the Grenadines'  = 'St. Vincent')