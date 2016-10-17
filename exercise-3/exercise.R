# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools', 'dplyr')
install.packages('dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)


# Which Acura model has the best hwy MPG in 2015? (without method chaining)
NoChaining <- function() {
  acura.2015 <- filter(vehicles, make == 'Acura', year == 2015) 
  max.hwy <- filter(acura.2015, hwy == max(hwy))
  best.model <- select(max.hwy, model)
}

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
Nested <- function () {
  best.model <- select(
                  filter(
                    filter(vehicles, make == 'Acura', year == 2015), hwy == max(hwy)
                  ), model
                )
}

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
Pipe <- function(){
  pipe.acura <- filter(vehicles, make == 'Acura', year == 2015) %>% 
                filter(hwy == max(hwy)) %>% 
                select(model)
}

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
system.time(for (i in 1:1000) NoChaining())
system.time(for (i in 1:1000) Nested())
system.time(for (i in 1:1000) Pipe())
