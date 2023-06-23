import json
import argparse
import pandas as pd

# Parse arguments
argument_parser = argparse.ArgumentParser()
argument_parser.add_argument('--csv_file', help='CSV file to convert to JSON')
file_path = argument_parser.parse_args().csv_file

# Check if CSV file path is provided
if not file_path:
    print("Please provide the path to the CSV file.")
    exit(1)

player_list = {}

# Read the CSV file using pandas
df = pd.read_csv(file_path)

# Iterate through columns
for cindex, column in enumerate(df.columns):
    if cindex <= 1:
        continue
        
    # Create a new JSON object for each column
    data = {}
    name = ""
    
    # Iterate through rows
    for index, value in df[column].items():
        # Check if the value is not null or NaN
        if pd.notnull(value):
            if index == 0:
                name = value
            else:
                print(df.iloc[index][0])
                data[df.iloc[index][1]] = value

    data["오버롤"] = df.columns[cindex]
    
    if data["총 능력치"] == "0":
        continue

    player_list[name] = data
    print("JSON data created for", name)

# Write player_list dictionary to a JSON file
output_path = "assets/player_data.json"
with open(output_path, 'w') as output_file:
    output_string = json.dumps(player_list, ensure_ascii=False).encode('utf8')
    output_file.write(output_string.decode())
    print("JSON data written to", output_path)
