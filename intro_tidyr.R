library(tidyr)
library(dplyr)
library(ggplot2)
library(readr)
#library(stringr)

bikenet <- read_csv("data/bikenet-change.csv")
summary(factor(bikenet$facility2013))

# gather facility columns into single year variable
colnames(bikenet)
bikenet_long <- bikenet %>% 
  gather(key = "year", value = "facility", # key is new area
         facility2008: facility2013, na.rm = TRUE) %>% 
  mutate(year = stringr::str_sub(year, start = -4))
head(bikenet_long)

# collapse/unite street and suffix to one value
bikenet_long <- bikenet_long %>% 
  unite(col = "street", c("fname", "ftype"), sep = " ") #oops, missing space 
head(bikenet_long)
# highlight and rerun

# seperate street and suffix back to two values
bikenet_long <- bikenet_long %>% 
  separate(street, c("name", "suffix")) # not so simple, mult spaces to sep
head(bikenet_long)

bikenet_long %>%
  filter(bikeid == 139730) # search by bikeid

fac_lengths <- bikenet_long %>% 
  filter(facility %in% c("BKE-LANE", "BIKE-BLVD", "BKE-BUFF", 
                         "BKE-TRAK", "PTH-REMU")) %>%
  group_by(year, facility) %>% 
  summarise(metres = sum(length_m)) %>% 
  mutate(miles = metres / 1609)
head(fac_lengths)

