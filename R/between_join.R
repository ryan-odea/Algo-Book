library(data.table)
#A function to 'between_join' two dataframes.
#Similar to a left_join, but joins the two dataframes if @'between_col' is between @'min_col' and @'max_col'

#@A A dataframe of values and ranges
#@B A dataframe to join on

#@min_col A column within A, should be the minimum of the range to join on
#@max_col A column within A, should be the maximum of the range to join on
#@value_col A colum within A, should be the value to join onto B

#@between_col A column within B, should be a value occuring between min and max ranges on A

between_join <- function(A, B, min_col, max_col, value_col, between_col) {
  A <- as.data.table(A); B <- as.data.table(B)
  
  setkeyv(A, cols = c(min_col, max_col))
  B[, temp_col := get(between_col)]
  
  result <- foverlaps(B, A, by.x = c("temp_col", between_col), nomatch = 0L)[, temp_col := NULL]
}
