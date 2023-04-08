CREATE TABLE OUT (final_normalized_value NUMERIC);
WITH
  total_sum AS (
    SELECT SUM(value_column) AS total FROM my_table
  ),
  normalized_values AS (
    SELECT value_column / total AS normalized_value, value_column
    FROM {{my_table}}, total_sum
  ),
  max_diff_idx AS (
    SELECT 
      ROW_NUMBER() OVER (ORDER BY ABS(normalized_value - value_column) DESC) AS rn,
      normalized_value, 
      value_column
    FROM normalized_values
  ),
  diff AS (
    SELECT 1 - SUM(normalized_value) AS difference FROM normalized_values
  )
INSERT INTO OUT (final_normalized_value)
SELECT
  CASE 
    WHEN rn = 1 THEN normalized_value + difference
    ELSE normalized_value
  END AS final_normalized_value
FROM max_diff_idx, diff;