# install the latest version of the Epi R Handbook package
pacman::p_install_gh("appliedepi/epirhandbook")

# load the package for use
pacman::p_load(epirhandbook,
               rio,
               tidyverse)




#Set Working Directory
getwd()
setwd("/cloud/project/data")
getwd()

#Get all data for the book
# download all the example data into a folder on your computer
get_data("all")

#inmport CSV data
linelist <- import("linelist_cleaned.xlsx")
military_hosp <- import("Military Hospital.csv")
addresses <- import("https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv")

#Simple data checking
dim(linelist)
table(linelist$gender)
summary(linelist$age)
hist(linelist$age)

filter(mtcars,carb >1)

mtcars <- mtcars

example <- mtcars %>% 
           filter(carb > 1)  %>% 
           group_by(cyl)  %>% 
           summarize(avg_mpg = mean(mpg)) %>% 
           arrange(desc(avg_mpg))


#Example Anaalysis

military_hosp <- import("Military Hospital.csv")

table(military_hosp$outcome)

subset_mili <- military_hosp %>% 
               filter(outcome != "",
                      !is.na(age)) %>% 
               group_by(outcome) %>% 
               summarize(medianAge = median(age),
                         meanAge = mean(age)
                         )
export(subset_mili, "/cloud/project/subsetMilitary.csv")
