import numpy as np
import csv

config = {
    "input_file": "lahore_sensors.csv",
    "output_file": "cleaned_sensors.csv",
    "aqi_threshold": 200
}

def load_data(file_name):
    with open(file_name, 'r', newline='', encoding='utf-8') as f:
        reader = csv.reader(f)
        header = next(reader)
        parsed_data = []
        for row in reader:
            cleaned_row = []
            for val in row:
                if (val != ""):
                    cleaned_row.append(float(val))
                else:
                    cleaned_row.append(np.nan)
            parsed_data.append(cleaned_row)
        return np.array(parsed_data, dtype=np.float64)
    
def clean_data(data, threshold):
    aqi_col = data[:,3]
    aqi_mean = np.nanmean(aqi_col)

    data[:,3] = np.where(np.isnan(data[:,3]), aqi_mean, data[:,3] )
    data = data[data[:,1]>=0]
    data[:,3] = np.where(data[:,3]>threshold, threshold, data[:, 3])
    return data
def save_data(file_name, data):
    with open(file_name, "w", newline = "", encoding = "utf-8") as f:
        writer = csv.writer(f)
        writer.writerows(data)

if __name__ == "__main__":
    # 1. Load the data
    raw_data = load_data(config["input_file"])
    print("Data loaded successfully.")

    # 2. Clean the data
    cleaned_data = clean_data(raw_data, config["aqi_threshold"])
    print("Data cleaning complete.")

    # 3. Save the data
    save_data(config["output_file"], cleaned_data)


    



