library(dslabs)
data(murders)
murders <- mutate(murders, rate=total/population*10^5)

x <- murders$population / 10^5
y <- muders$total

# 0) Scatter Plot
plot(x, y)

# 1) Hist Plot
plot(muders$rate)

# 2) Box Plot
boxplot(rate~region, data=muders)