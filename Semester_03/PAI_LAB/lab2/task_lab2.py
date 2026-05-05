import csv
import random
random.seed(42)

new_list = []
filtered_data = []
with open('data_lab2.csv', mode='r', newline='', encoding = 'utf-8') as file:
     reader = csv.reader(file)
     header = next(reader) 
     # header.index('quantity')
     # header.index('price')
     for row in reader:
         try:
              quantity = int (row[2])
              price = float (row[3])
              if quantity>2:
                  total_revenue = quantity * price
                  new_list.append(total_revenue)
                  filtered_data.append((row))
                  #print(f"Total revenue for {row[1]}: {total_revenue}")
         except ValueError:              
              print(f"Invalid quantity value: {row[2]} in row: {row}")
              pass


#random.sample(list, size=5) 
random.shuffle(filtered_data) 
print(f"filtered_data: {filtered_data}")                
                   
              
