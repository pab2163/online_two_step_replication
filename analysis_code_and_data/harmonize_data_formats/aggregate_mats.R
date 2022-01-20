source('harmonize_data_formats/read_one_participant_mat.R')
library(R.matlab)
library(tidyverse)


decker_files = Sys.glob('data/decker/decker_mat_files/*.mat')
potter_files = Sys.glob('data/potter/potter_mats/*.mat')

decker_df = decker_files %>% 
  map_dfr(read_one_participant, total_trials = 200)

potter_df = potter_files %>% 
  map_dfr(read_one_participant, total_trials = 150)


write.csv(decker_df, file = 'data/decker/combined_decker_data.csv', row.names = FALSE)
write.csv(potter_df, file = 'data/potter/combined_potter_data.csv', row.names = FALSE)

