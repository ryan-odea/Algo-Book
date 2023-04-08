# Identify the index of the element with the largest absolute difference from its original value
# Add the difference to the element with the largest absolute difference
def normalize_to_one(x):
    if not all(isinstance(i, (int, float)) for i in x):
        raise ValueError("Input must be a list or tuple of numerics")

    normalized_x = [i / sum(x) for i in x]
    diff = 1 - sum(normalized_x)

    max_diff_idx = max(range(len(x)), key=lambda i: abs(normalized_x[i] - x[i]))
    normalized_x[max_diff_idx] += diff

    return normalized_x