import numpy as np
import csv

# 1. Configuration Dictionary
config = {
    "input_file": "grades.csv",
    "output_file": "normalized_grades.csv",
    "midterm_threshold": 0.5,
    "final_col_idx": 2
}

def load_data(file_name):
    """Safely loads CSV data and handles missing values."""
    # Use 'with' for auto-close and explicitly set encoding/newline
    with open(file_name, 'r', newline='', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader)  # Skip the header row
        
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

def clean_and_normalize(data, threshold):
    """Fills NaNs, normalizes via broadcasting, and filters data."""
    # Step A: Fill NaNs in the final_score column (Index 2)
    final_col_idx = config["final_col_idx"]
    # Calculate mean while ignoring NaNs
    avg_final = np.nanmean(data[:, final_col_idx])
    
    # Use np.where to patch only the missing values
    data[:, final_col_idx] = np.where(np.isnan(data[:, final_col_idx]), 
                                      avg_final, 
                                      data[:, final_col_idx])
    
    # Step B: Normalize scores using Broadcasting
    # Calculate max for every column (axis=0)
    max_vals = data.max(axis=0)
    # Broadcast division: (N, 3) / (3,) works because trailing dims match
    normalized_data = data / max_vals
    
    # Step C: Filter based on midterm_score (Index 1)
    mask = normalized_data[:, 1] >= threshold #
    return normalized_data[mask]

def save_data(file_name, data):
    """Writes the processed NumPy array to a CSV file."""
    # Explicitly define newline to prevent double-spacing on Windows
    with open(file_name, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerows(data) #

# 2. Execution Guard
if __name__ == "__main__":
    try:
        # Load
        raw_grades = load_data(config["input_file"])
        
        # Process
        final_grades = clean_and_normalize(raw_grades, config["midterm_threshold"])
        
        # Output
        save_data(config["output_file"], final_grades)
        print(f"Successfully processed {len(final_grades)} students.")
        
    except FileNotFoundError:
        print(f"Error: Could not find {config['input_file']}. Check your config.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


