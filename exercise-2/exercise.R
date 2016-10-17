# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools', 'dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy, dplyr)

# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997
cars.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
city.drive <- filter(vehicles, cty > 20 & drive == '2-Wheel Drive')

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy <- filter(city.drive, hwy == min(hwy))
worst.hwy <- select(worst.hwy, id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYear <- function(my.make, my.year) {
  best.hwy <- filter(vehicles, make == my.make, year == my.year) %>% 
              filter(hwy == max(hwy)) %>% 
              select(model)
    
  return(best.hwy)
}

# What was the most efficient honda model of 1995?
MakeYear('Honda', 1995)


