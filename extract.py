import requests
import json
import pandas as pd

def convert_json_to_csv(url, csv_file):
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()

        # Convert specific columns to appropriate data types
        convert_columns = {
            "fiscal_year": int,
            "payroll_number": int,
            "agency_start_date": pd.to_datetime,
            "base_salary": float,
            "regular_hours": float,
            "regular_gross_paid": float,
            "ot_hours": float,
            "total_ot_paid": float,
            "total_other_pay": float
        }

        for column, convert_func in convert_columns.items():
            data = convert_column_data(data, column, convert_func)

        df = pd.DataFrame(data)
        df.to_csv(csv_file, index=False)
        print(f"JSON data from '{url}' converted to CSV file '{csv_file}'")
    else:
        print("Error retrieving JSON data from '{url}'")

def convert_column_data(data, column, convert_func):
    for item in data:
        if column in item:
            item[column] = convert_func(item[column])
    return data

if __name__ == '__main__':
    api_url = "https://data.cityofnewyork.us/resource/k397-673e.json"
    csv_file = "data.csv"
    convert_json_to_csv(api_url, csv_file)
