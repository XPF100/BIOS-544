#Module Three
library(pacman)
pacman::p_load(
  lubridate,  # general package for handling and converting dates
  tidyverse,  # data management and visualization  
  rio)        # data import/export

linelist <- import("linelist_cleaned.xlsx")


#get the system date - this is a DATE class
todayDT <- Sys.Date()
class(todayDT)
# get the system time - this is a DATETIME class
Sys.time()

todayDT <- ymd("2022-01-26")
#Lubridate and why R is vectorized
#Steps:
# Read in data
# Look at data
# Note the date format
# 'Cast' to date format using lubridate
linelist$date_infection <- ymd(linelist$date_infection)
linelist$date_hospitalisation <- ymd(linelist$date_hospitalisation)

linelist$dates <- interval(linelist$date_infection, linelist$date_hospitalisation)

linelist$inf_to_hosp <-linelist$dates/days(1)
startdt = ymd("2015-01-01")
linelistSurv <- linelist %>% 
                filter(!is.na(outcome),
                       !is.na(date_infection),
                       !is.na(date_outcome)) %>% 
                mutate( survDT = interval(date_infection, date_outcome),
                        survival = survDT/days(1),
                        cohortDate = interval(startdt, ymd("2015-12-31"))) %>% 
                filter(date_infection %within% cohortDate) %>% 
                       #outcome == "Death",
                       #age %in% c(21, 22, 23, 24, 25))
                mutate(numOutcome = ifelse(outcome == "Death", 1, 0))

linear <- lm(survival ~ age, linelistSurv )
logistic <- glm(numOutcome~gender, family="binomial", linelistSurv)
summary(linear)
summary(logistic)





