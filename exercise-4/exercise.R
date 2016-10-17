# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package

install.packages("nycflights13")
library(nycflights13, dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, gained = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, desc(gained))

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- mutate(flights, gained = arr_delay - dep_delay) %>% 
          arrange(desc(gained))

# Make a histogram of the amount of gain using the `hist` command
hist(flights$gained)

# On average, did flights gain or lose time?
mean(flights$gained, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
to.sea <- filter(flights, dest == 'SEA')

# On average, did flights to seatac gain or loose time?
mean(to.sea$gained, na.rm = TRUE)

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation
OrgToDest <- function(my.origin, my.dest, custom.col) {
  cust.frame <- filter(flights, origin == my.origin, dest == my.dest) %>% 
                select_(custom.col) 
  return(cust.frame)
}

# Retireve the air_time column for flights from JFK to SEA
jfk.to.sea <- OrgToDest('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  
mean(jfk.to.sea$air_time, na.rm = TRUE) / 60

# What was the min/max average air time for the JFK to SEA flights?
min(jfk.to.sea$air_time, na.rm = TRUE) / 60
max(jfk.to.sea$air_time, na.rm = TRUE) / 60
