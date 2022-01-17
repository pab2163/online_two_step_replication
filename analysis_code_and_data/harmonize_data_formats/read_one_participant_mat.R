library(R.matlab)
library(tidyverse)



# Function to read .mat file for 1 participant, put into a data.frame ---------------

read_one_participant = function(filepath, total_trials){
  # read in .mat file as a list
  data_list = R.matlab::readMat(filepath)
  
  # initialize dataframe
  df = data.frame(trial_num = 1:total_trials)
  
  # go through list elements and add to dataframe
  for (list_element in 1:length(data_list)){
    # pull elements that have the same length as the total number of trials
    if (length(data_list[[list_element]]) == total_trials){
      
      # add to dataframe with corresponding list element name as column name
      df = cbind(df, as.vector(data_list[[list_element]]))
      names(df)[ncol(df)] = names(data_list)[list_element]
    }
  }  
  
  # get participant id
  df$id = as.character(data_list$name)
  
  return(df)
}


