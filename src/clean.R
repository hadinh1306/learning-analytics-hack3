library(tidyverse)
library(googledrive)

# read data
assessment <- read_csv("data/raw-data/assessments.csv")
# courses <- read_csv("data/raw-data/courses.csv")
studentAssess <- read_csv("data/raw-data/studentAssessment.csv")
studentInfo <- read_csv("data/raw-data/studentInfo.csv")
studentRegistration <- read_csv("data/raw-data/studentRegistration.csv")
studentVle <- read_csv("data/raw-data/studentVle.csv")
vle <- read_csv("data/raw-data/vle.csv")

# clean data
studentInfo_c <- studentInfo %>% 
  select(-studied_credits) %>% 
  filter(code_presentation %in% c("2014B", "2014J"),
         final_result %in% c("Pass", "Withdrawn"))

master_assessment <- left_join(assessment, studentAssess)

master <- left_join(studentInfo_c, studentRegistration) %>% 
  left_join(., studentVle) %>% 
  left_join(., vle) %>% 
  left_join(., master_assessment, by = c("code_module", "code_presentation", "id_student"))

master_filtered <- master %>% 
  select(-date.x, -id_site, -is_banked,
         -week_from, -week_to) %>% 
  rename(deadline = date.y) %>% 
  filter(code_presentation == "2014J",
         code_module %in% c("AAA", "BBB", "GGG"))

write_csv(master_filtered, "data/clean_data.csv")
