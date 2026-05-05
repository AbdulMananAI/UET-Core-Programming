import numpy as np
data = np.array([[10,20],[30,40]])
print(data.ndim)
print(data.shape)
print(data.size)
print(data.dtype)

zero_matrix = np.zeros((3,3), dtype=(np.int32))
spaced_arr = np.linspace(10, 20, 5)
ones_matrix = np.ones((3,3))
print(zero_matrix)
print(spaced_arr)
print(ones_matrix)

arr = np.array([10, 20, 30, 40, 50])
print(arr)
my_slice = arr[2:4]
print(my_slice)
my_slice[:] = 99
print(my_slice)
arr_copy = arr.copy()
print(arr_copy)

matrix = np.array([[-5, 10, 15], [20, -25, 30]])
last_col  = matrix[:, 2] #[:, -1]
print(matrix)
print(last_col)
matrix[matrix<0] = 0
print(matrix)

A = np.ones((3,3))
B = np.array([10, 20, 30]) #(3,)
result_row_add = A+B
result_col_add = A + B[:, np.newaxis]
print(A)
print(B)
print(result_row_add)
print(result_col_add)

X = np.zeros((4,4))
Y = np.array([10, 20, 30, 40]) #(4,)
result_row_add = X+Y
final_matrix = X + Y[:, np.newaxis]
print(X)
print(Y)
print(result_row_add)
print(final_matrix)