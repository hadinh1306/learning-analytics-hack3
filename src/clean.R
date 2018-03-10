library(tidyverse)

# read data
assessment <- read_csv("data/raw-data/assessments.csv")
courses <- read_csv("data/raw-data/courses.csv")
studentAssess <- read_csv("data/raw-data/studentAssessment.csv")
studentInfo <- read_csv("data/raw-data/studentInfo.csv")
studentRegistration <- read_csv("data/raw-data/studentRegistration.csv")
studentVle <- read_csv("data/raw-data/studentVle.csv")
vle <- read_csv("data/raw-data/vle.csv")

# join data 
master <- left_join(studentAssess, studentRegistration) %>% 
  left_join(., studentInfo) %>% 
  left_join(., studentVle)
