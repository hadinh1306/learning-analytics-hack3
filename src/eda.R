# package dependencies
library(tidyverse)

# EDA
studentVle %>% 
  group_by(code_presentation) %>% 
  summarise(n = n())

studentInfo %>% 
  group_by(final_result) %>% 
  count()

studentAssess %>% 
  group_by(is_banked) %>% 
  count

studentInfo %>% 
  group_by(region) %>% 
  count()

region_imd <- studentInfo %>% 
  group_by(region, imd_band) %>% 
  count()

studentInfo %>% 
  group_by(num_of_prev_attempts) %>% 
  count()

studentInfo %>% 
  group_by(final_result,disability) %>% 
  count()


viewthis <- master %>% 
  filter(id_site == "877049")

diff_submit_df <- master_filtered %>% 
  filter(date_submitted > deadline) %>% 
  mutate(diff_submit = date_submitted - deadline)
mean(diff_submit_df$diff_submit)
summary(diff_submit_df$diff_submit)

filtered <- diff_submit_df %>% 
  filter(diff_submit < 200)

filtered <- master_filtered %>% 
  filter(final_result == "Withdrawn") %>%
  group_by(id_student) 

n_distinct(filtered$id_student)
  
studentInfo %>% 
  filter(final_result == "Withdrawn") %>% 
  group_by(id_student) %>%
  n_distinct()
  



