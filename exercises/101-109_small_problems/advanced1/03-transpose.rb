# Transpose 3x3

# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6
# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

# To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.
# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6
# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# Examples

# row index is going to be equal to the column index (row index is the array, column index is the element within the array)

def transpose(matrix)
  new_matrix = []
  matrix.count.times { new_matrix << [] }
  
  matrix.each_index do |row|
    matrix[row].each_index do |column|
      new_matrix[column][row] = matrix[row][column]
    end
  end
  
  new_matrix
end

# use map to return the new row

def transpose(matrix)
  result = []
  
  matrix.each.with_index do |arr, row|
    result << arr.each.with_index.with_object([]) { |(_, column), new_row| new_row << matrix[column][row] }
  end
  
  result
end

# since I really only care about indeces probably better to not use an each iterator

def transpose(matrix)
  result = []
  matrix.size.times { result << [] }
  
  0..matrix.size.times do |row|
    0..matrix.size.times do |column|
      result[row][column] = matrix[column][row]
    end
  end
  
  result
end

# transpose! without using above
require 'pry'
def transpose!(matrix)
  matrix.each do |row|
    matrix.size.times do |idx|
      matrix[idx] << row.shift
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# This program should print "true" twice.

p transpose!(matrix)