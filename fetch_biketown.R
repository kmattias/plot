# functions to fetch biketown data
# https://www.biketownpdx.com/system-data
# pacman allows check for & install missing packages

if(!require("pacman")) (install.packages("pacman")); library(pacman)

pacman::p_load("lubridate")
pacman::p_load("dplyr")
pacman::p_load("stringr")
pacman::p_load("readr")

# using baseR
# pkgs <- c("lubridate", etc..)
# install.packages(pkgs)

get_data <- function(start="7/2016", end=NULL,
                     base_url="https://s3.amazonaws.com/biketown-tripdata-public/",
                     outdir="data/") {
  # if no end date given, set to now
  
  end <- ifelse(is.null(end), format(now(), "%m/%Y"), end)
  
  # takes start & end in mm/yyyy, tries to dwnld files
  # make url func only avail within get_data
  make_url <- function(date, base_url) {
    url <- paste0(base_url, format(date, "%Y_%m"), ".csv")
    return(url)
  }
  # parse date range
  start_date <- lubridate::myd(start, truncated = 2)
  end_date <- lubridate::myd(end, truncated = 2)
  date_range <- seq(start_date, end_date, by="months")
  
  #lapply (a,b) just applies func b to seq a and returns list 
  # of the modififed sequence
  urls <- lapply(date_range, make_url, base_url=base_url)
  
  # for loops can be easier for early development
  # u can be any letter, x or first letter common
  for(u in urls) {
    download.file(u, destfile = paste0(outdir, 
                                       str_sub(u, -11)))
  }
  
}

# # manual run #
# # params
# start = "11/2018"
# end = "4/2019"
# 
# get_data(start, end)
