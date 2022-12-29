# 0 - Getting and Changing the Working Directory
getwd()
setwd('C:/Users/Fx/Desktop/Studies/1 - MBA/5 - Harvard Courses/3 - Data Wrangling')

# 1 - Reading a dataset and saving a copy
# into the Working Directory. The original
# dataset is from 'dslabs' package in 'extdata'
# directory
path <- system.file('extdata', package='dslabs')
list.files(path)
filename <- 'murders.csv'
fullpath <- file.path(path, filename)

file.copy(fullpath, getwd())
file.exists(filename) # checking out if the file was saved succesfully

# 2 - Reading a Dataset from the Internet By URL
url <- 'https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv'
data <- read.csv(url)

url <- 'https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv'
temp_filename <- tempfile()
download.file(url, temp_filename)
data <- read.csv(temp_filename)
file.remove(temp_filename)


# 3 - Reading Lines of the Dataset
library(dslabs)
library(tidyverse)
library(readxl) # read_lines, read_csv, read_excel...

read_lines(filename, n_max=5) # reads the first five rows

# Some way of reading the dataset
data <- read_csv(filename) # returns a tibble object
data <- read_csv(fullpath) # returns a tibble object
data <- read.csv(filename) # returns a dataframe object
data <- read.csv(fullpath) # returns a dataframe object
head(data) # returns the first six rows

# 4 - Checking Out the Columns' Names
# and Their Data Types
names(data)
class(data$region)
class(data$state)
class(data$population)