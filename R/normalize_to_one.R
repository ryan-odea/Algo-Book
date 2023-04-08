# Identify the index of the element with the largest absolute difference from its original value
# Calculate the difference between 1 and the sum of the normalized vector
# Add the difference to the element with the largest absolute difference

normalize_to_one <- function(x) {
  if (!is.numeric(x)) {
    stop("Input must be a numeric vector")
  }
  normalized_x <- x/sum(x)
  
  diff <- 1-sum(normalized_x)
  
  max_diff_idx <- which.max(abs(normalized_x - x))
  normalized_x[max_diff_idx] <- normalized_x[max_diff_idx] + diff
  
  return(normalized_x)
}