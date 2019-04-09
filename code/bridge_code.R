# read in excel bike count and tab weather data

library(readxl)
library(lubridate)
library(dplyr)
library(readr)

input_file <- "data/Hawthorne Tilikum Steel daily bike counts 073118.xlsx"
bridge_names <- c("Hawthorne", "Tilikum", "Steel")

# define a fucntion that laods excel sheets
load_data <- function(bridge_name, input_file) {
  bike_counts <- read_excel(input_file, sheet = bridge_name, 
                            skip = 1) %>% #skip header columns
    filter(total > 0) %>% 
    select(date, total) %>% 
    mutate(bridge = bridge_name, date = as.Date(date)) #drops useless time
}
# h <-load_data("Broadway",input_file)
# load data from each sheet into a list
# then combine all three into one dataframe

bikecounts <- lapply(bridge_names, load_data, 
                     input_file = input_file) %>% 
  bind_rows()

# factorize bridge name
bikecounts <- bikecounts %>% mutate(bridge = factor(bridge))


