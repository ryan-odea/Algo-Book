# Separates a dataframe into a list of dataframes along a specified column
#
# This is an example function named 'separate'
# which separates a long dataframe into a list of dataframes
# using a specified column as a key (split() in a handbag)
#
# @param data A dataframe
# @param column.name Separation column name
# @param save Boolean value if the list will be save to individual .csv files

separate <- function(data, column.name, save = FALSE){
  out = split(data, paste0('data$', column.name))

  names = unique(paste0("data$", column.name))
  if(save == TRUE){
    for(i in 1:length(out)){
      write.csv(out[[i]], paste0(names[i], ".csv"))
    }
  }
  return(out)
}
