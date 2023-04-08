import os
import pandas as pd

def bind(subdirectory, file_type="csv", output="list"):
    if file_type not in ["csv", "sas7bdat", "xlsx"]:
        raise ValueError("Only csv, sas7bdat, and xlsx files are currently supported")

    files = [os.path.join(subdirectory, f) for f in os.listdir(subdirectory) if f.endswith(file_type)]

    out_list = []

    for file in files:
        if file_type == "csv":
            out_list.append(pd.read_csv(file))
        elif file_type == "sas7bdat":
            out_list.append(pd.read_sas(file))
        elif file_type == "xlsx":
            out_list.append(pd.read_excel(file, engine="openpyxl"))

    if output == "dataframe":
        out_df = pd.concat(out_list, axis=0, ignore_index=True)
        return out_df
    elif output == "list":
        return out_list
    else:
        raise ValueError("Output files options are 'list' or 'dataframe'")
