import csv

# Variables to track our tasks
dirty_rows_count = 0
total_valid_score = 0
high_attendance_students = 0
clean_dataset = []

# Open and read the dataset (using utf-8-sig to handle any hidden characters in the CSV)
with open('data.csv', 'r', encoding='utf-8-sig') as file:
    reader = csv.reader(file)
    header = next(reader)
    
    # Safely find the column index for "Score" and "Attendance" 
    # regardless of whether they are uppercase or lowercase
    header_lower = [str(col).strip().lower() for col in header]
    score_index = -1
    attendance_index = -1
    
    for i, col in enumerate(header_lower):
        if 'score' in col:
            score_index = i
        if 'attendance' in col:
            attendance_index = i

    # Process the dataset row by row
    for row in reader:
        # TASK 1: DATA CLEANING
        try:
            score = float(row[score_index])
            attendance = float(row[attendance_index])
        except (ValueError, IndexError):
            # If conversion fails (empty cell, text, etc.), count as dirty and skip
            dirty_rows_count += 1
            continue

        # TASK 2: FEATURE ENGINEERING
        if score >= 80:
            performance_label = "High"
        elif score >= 50:
            performance_label = "Medium"
        else:
            performance_label = "Low"
            
        # Append the new label to the row and save it
        row.append(performance_label)
        clean_dataset.append(row)

        # TASK 3: DATA SLICING
        if attendance > 85:
            total_valid_score += score
            high_attendance_students += 1

# --- PRINTING THE RESULTS ---
print(f"Task 1: Total 'dirty' rows skipped: {dirty_rows_count}")

print(f"\nTask 2: Sample of cleaned data with new Performance Labels:")
for data in clean_dataset[:3]: # Print first 3 rows
    print(data)

print("\nTask 3: Data Slicing Result")
try:
    average_score = total_valid_score / high_attendance_students
    print(f"Average score for students with >85% attendance: {average_score:.2f}")
except ZeroDivisionError:
    print("No students were found with attendance above 85%.")