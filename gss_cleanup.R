## Data preparation and model creation
# Author: Cesar Villarreal
# License: MIT
# Description: Using part of the Canadian General Social Survey (GSS) 
# provided by the University of Toronto, this code cleans and analyses


#### Set Up ####
library(tidyverse)
library(plyr)

##### Data importation and cleaning ####
# Data source: http://www.chass.utoronto.ca/
# WARNING: You need to be a student or instructor in order to access
# this data.
gss_raw <- read.csv("AAoJPbDn.csv")

# Select columns of interest
gss_raw <- gss_raw[,c("agegr10", "sex", "whw120gr",
                       "jsr_02", "ttlincg2", "famincg2", "sem_01")]

# Remap values and rename columns for exploratory analysis
gss_labs <- gss_raw %>% 
  dplyr::rename(
    sex=sex,
    resp_age_group=agegr10,
    nhours_pweek=whw120gr,
    job_satifaction=jsr_02,
    income=ttlincg2,
    fam_income=famincg2,
    self_empl=sem_01
  )

gss_labs$sex <- gss_labs$sex %>% 
  mapvalues(from = c(1, 2),
            to=c("Male", "Female"))

gss_labs$resp_age_group <- gss_labs$resp_age_group %>%
  mapvalues(from=c(1:7),
            to=c("15-24", "25-34", "35-44", "45-54", "55-64", "65-74", "75+"))


gss_labs$nhours_pweek <- gss_labs$nhours_pweek %>%
  mapvalues(from=c(1:4, 6, 9),
            to=c("0-15h", "16-29h", "30-40h", "41+h", "VS", "VS"))


gss_labs$job_satifaction <- gss_labs$job_satifaction %>%
  mapvalues(from=c(1:8),
            to=c("Very satisfied", "Satisfied", "Neither", "Dissatisfied", "Very dissatisfied", NA, NA, NA))

gss_labs$self_empl <- gss_labs$self_empl %>%
  mapvalues(from=c(1, 2, 6:9),
            to=c("Yes", "No", "No", "No", "No", "No"))


gss_labs$income <- gss_labs$income %>%
  mapvalues(from=c(1:6),
            to=c("<$25k", "$25k-$49,999", "$50k-$74,999", "$75k-$99,999",
                 "$100k-$124,999", "$125k+"))


gss_labs$fam_income <- gss_labs$fam_income %>%
  mapvalues(from=c(1:6),
            to=c("<$25k", "$25k-$49,999", "$50k-$74,999", "$75k-$99,999",
                 "$100k-$124,999", "$125k+"))

write_csv(gss_labs, "gss.csv")
