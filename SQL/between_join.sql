SELECT B.id, B.between_value, A.value
FROM B
JOIN A ON B.between_value BETWEEN A.minimum AND A.maximum;