library(tidyverse)
source("R/utils.R")

GWR <- read_delim("data-raw/GWR/CH.zip", ";", escape_double = FALSE, trim_ws = TRUE) %>% 
  select(-GSTATLAB_FR, -GSTATLAB_IT) %>% 
  rename(GSTATLAB = GSTATLAB_DE)

# IDs

# EGID alone is not sufficient
GWR %>% unique_id(EGID)
GWR %>% filter(EGID == 155)

# better with edid but still duplis, bilangs?
GWR %>% unique_id(EGID, EDID)
GWR %>% filter(EGID == 974476)

GWR %>% unique_id(EGAID)

# street id?
GWR %>% unique_id(ESID)
