import pandas as pd

def find_value(row, A, min_col, max_col, value_col, between_col):
    mask = (A[min_col] <= row[between_col]) & (A[max_col] >= row[between_col])
    value = A.loc[mask, value_col]
    return value.iloc[0] if not value.empty else None

def between_join(A, B, min_col, max_col, value_col, between_col):
    B[value_col] = B.apply(find_value, args=(A, min_col, max_col, value_col, between_col), axis=1)
    B.dropna(subset=[value_col], inplace=True)

    return B