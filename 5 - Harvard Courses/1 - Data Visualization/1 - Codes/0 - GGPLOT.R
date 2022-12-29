# 0) Importing Libraries #

library(tidyverse) # ggplot2 is part of this library
library(ggplot2) # but you can import just the especific library
library(ggthemes) # different themes for the plots
library(ggrepel) # avoid the texts overlap between each other

library(dslabs)
data(murders)

# 1) Assigning the dataset to ggplot #
ggplot(data=murders)
ggplot(murders)
murders %>% ggplot()

my_plot <- ggplot(data=murders)

# Some Functions
#
# \ size >> size of the points (outside aes)
# \ nudge_x >> labels' x position (outside aes)
# \ nudge_y >> labels' y position (outside aes)

p <- murders %>% geom_plot(aes(x=column1, y=column2))
			       + geom_text(aes(x=column1, y=column2, label=column3_categorical))

p + geom_point(size=3)
  + geom_text(nudge_x=1)

# 2) Creating Scatter Plot #
#
# \ geom_text_repel >> avoids the labels overlap against each other
# \ scale_x/y_log10 >> changes the axis scale
# \ x/ylab >> adds labels to the axis
# \ ggtitle >> adds title to the plot
# \ color >> adds a single color to the points
# \ col >> adds different colors to the points
# \ scale_color_discrete >> changes the legend's title
# \ abline >> traces a line in the plot
# \ themes >> adds a new theme to the plot

rate <- murders 
		%>% summarize(rate=sum(total)/sum(population)*10^6)
		%>% pull(rate)

my_plot <- murders %>%
		   + geom_plot(aes(x=population/10^6, y=total, label=abb))
		   + geom_text(nudge_x=0.075)
		   + geom_text_repel()
		   + scale_x_log10()
		   + scale_y_log10()
		   + xlab('Label X-Axis')
		   + ylab('Label Y-Axis')
		   + ggtitle('Plot\' Title')
		   + geom_abline(intercept=log10(rate), lty=2, color='darkgray')
		   #+ geom_point(color='blue', size=3) # adds a single color to the points
		   + geom_point(aes(col=region), size=3) # adds colors to the points by region
		   + scale_color_discrete(name='Region')
		   + theme_economist()

# 3) GGPLOT2 >> Other Examples

# Histogram #

# basic histograms
p + geom_histogram()
p + geom_histogram(binwidth = 1)

# histogram with blue fill, black outline, labels and title
p + geom_histogram(binwidth = 1, fill = "blue", col = "black")


####


# KDE #
p + geom_density()
p + geom_density(fill = "blue")


####


# Quantile-Quantile #

# basic QQ-plot
p + geom_qq()

# QQ-plot against a normal distribution with same mean/sd as data
params <- murders 
	%>% filter(region == "Northeast") 
    %>% summarize(mean = mean(population), sd = sd(population))

p + geom_qq(dparams = params)
  + geom_abline()


####


# Grids #
p <- murders %>% filter(region == "Northeast") %>% ggplot(aes(x=population))
p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")

# arrange plots next to each other in 1 row, 3 columns
library(gridExtra)
grid.arrange(p1, p2, p3, ncol = 3)

#######


# 4) Faceting and Griding #
#
# \ facet_grid >> shows plots side by side (rows)
# \ facet_wrap >> shows plots side by side (rows and columns)
p <- facet_grid(continent~year)
p <- facet_grid(.~year)
p <- facet_wrap(~year)

# 5) Time-Series Plots #

countries <- c("South Korea", "Germany")
labels <- data.frame(country=countries, x=c(1975, 1965), y=c(60, 72))

gapminder %>% filter(country %in% countries) 
		  %>% ggplot(aes(year, life_expectancy, col=country))
		  + geom_line()
    	  + geom_text(data=labels, aes(x, y, label=country), size=5)
		  + theme(legend.position="none")