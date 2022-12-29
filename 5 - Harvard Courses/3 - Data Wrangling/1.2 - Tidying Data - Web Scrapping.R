library(rvest)

# 0 - Geetting the HTML Document
#
# read_html() : gets the HTML document of a web page
url <- 'https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state'
document <- read_html(url)
class(document)
document

# 1 - Getting the First Table
# and Converting into a DataFrame
#
# html_nodes() : gets all elements
# html_node()  : gets the first element
# html_table   : converts html into dataframe
df <- document %>% html_nodes('table')
df <- df[[2]] # getting the second table
df <- df %>% html_table

# changing the columns' names
df <- df %>% setNames(c('state', 'population', 'total', 'murders', 'gun_murders', 'gun_ownership', 'total_rate', 'murder_rate', 'gun_murder_rate'))