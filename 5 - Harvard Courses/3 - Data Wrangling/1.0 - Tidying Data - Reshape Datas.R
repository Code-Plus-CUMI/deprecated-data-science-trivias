library(dslabs)
library(tidyverse)

# 0 - Reading a Wide Dataset
path <- system.file('extdata', package='dslabs')
filename_path <- file.path(path, 'dataset_name.csv')
wide_data <- read.csv(filename_path)
wide_data
# country  2021   2022
#  <chr>   <chr>  <chr>
# Brazil    2.5    3.4
# EUA       4.6    7.8

# 1 - Converting a Wide Dataset
# into a Tidy One
wide_data <- pivot_longer(-country)
# country  name   value
#  <chr>   <chr>  <chr>
# Brazil    2021   2.5    
# Brazil    2022   3.4
# EUA       2021   4.6
# EUA       2022   7.8

wide_data <- pivot_longer(-country
					    , names_to='year'
					    , values_to='income')
# country  year   income
#  <chr>   <chr>  <chr>
# Brazil    2021   2.5    
# Brazil    2022   3.4
# EUA       2021   4.6
# EUA       2022   7.8

tidy_data <- wide_data %>%
			 pivot_longer(-country
			 			, names_to='year'
			 			, values_to='income'
			 			, names_transform=list(year=as.numeric(), income=as.numeric()))
# country  year   income
#  <chr>   <int>  <dbl>
# Brazil    2021   2.5    
# Brazil    2022   3.4
# EUA       2021   4.6
# EUA       2022   7.8

# 2 - Converting a Tidy Dataset
# into a Wide One
wide_data <- tidy_data %>%
			 pivot_wider(-country
			 			, names_from='year'
			 			, values_from='income')
# country  2021   2022
#  <chr>   <chr>  <chr>
# Brazil    2.5    3.4
# EUA       4.6    7.8

# 3 - Separating Columns
wide_data <- tidy_data %>% pivot_longer(-country)
# country       name             value
#  <chr>        <chr>            <dbl>
# Brazil     2021_income          2.5
# Brazil     2022_new_income      3.4 
# EUA        2021_income          4.6
# EUA        2022_new_income      7.8

wide_data %>% separate(name, c('year', 'name'), sep='_')
# country    year      name      value
#  <chr>     <chr>     <chr>     <dbl>
# Brazil     2021      income     2.5
# Brazil     2022      new        3.4 
# Brazil     2022      income     <NA>
# EUA        2021      income     4.6
# EUA        2022      new        7.8
# EUA        2022      income    <NA>

wide_data %>% separate(name, c('year', 'name')
					 , sep='_', extra='merge')
# country    year      name       value
#  <chr>     <chr>     <chr>      <dbl>
# Brazil     2021      income      2.5
# Brazil     2022      new_income  3.4 
# EUA        2021      income      4.6
# EUA        2022      new_income  7.8

wide_data %>% separate(name, c('year', 'name')
					  , sep='_', extra='merge'
					  , convert=TRUE)
# country    year      name       value
#  <chr>     <int>     <chr>      <dbl>
# Brazil     2021      income      2.5
# Brazil     2022      new_income  3.4 
# EUA        2021      income      4.6
# EUA        2022      new_income  7.8

wide_data %>% separate(name, c('year', 'name')
	                 , sep='_', extra='merge'
	                 , convert=TRUE)
	      %>% pivot_wider()
# country    year      income    new_income
#  <chr>     <int>     <dbl>      <dbl>
# Brazil     2021      2.5         <NA>
# Brazil     2022      <NA>        3.4 
# EUA        2021      4.6         <NA>
# EUA        2022      <NA>        7.8

# 4 - Uniting Separated Columns
wide_data <- wide_data %>% separate(name, c('year', 'name')
	                              , sep='_', extra='merge'
	                              , convert=TRUE)
                       %>% pivot_wider()

wide_data <- wide_data %>% unite(name, income, new_income, sep='_')
# country    year      income_new_income
# <chr>      <int>           <dbl>  
# Brazil     2021             2.5
# Brazil     2022             3.4 
# EUA        2021             4.6
# EUA        2022             7.8