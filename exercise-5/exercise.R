# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
install.packages("nycflights13")
install.packages('dplyr')
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
delay.by.month <- group_by(flights, month) %>% 
                  summarise(avg_delay = mean(dep_delay, na.rm = TRUE))

max.delay.month <- filter(delay.by.month, avg_delay %in% max(avg_delay, na.rm = TRUE))

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(delay.by.month)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data

delay.per.airport <- group_by(flights, dest) %>% 
                    summarise(delay = mean(dep_delay, na.rm = TRUE)) %>% 
                    arrange(-delay)

#filter(delay.per.airport, delay %in% max(delay, na.rm = TRUE)) #selects highets delay

### Bonus ###
# Which city was flown to with the highest average speed?
mean.speed.to.dest <- mutate(flights, speed = (distance / air_time) * 60 ) %>% 
                          group_by(dest) %>% 
                          summarise(avg_speed = mean(speed, na.rm = TRUE)) %>% 
                          arrange(-avg_speed)

fastest.to.dest <- filter(mean.speed.to.dest, avg_speed %in% max(avg_speed, na.rm = TRUE))


