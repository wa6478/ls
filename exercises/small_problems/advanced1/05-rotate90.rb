require 'pry'
# def rotate90(matrix)
#   result = []
#   new_rows = matrix[0].count
#   new_columns = matrix.count
#   new_rows.times { result << [] }

#   new_rows.times do |rowidx|
#     new_columns.times do |colidx|
#       result[rowidx][colidx] = matrix.reverse[colidx][rowidx] 
#     end
#   end
  
#   result
# end

def rotate90(matrix)
  result = []
  rows = matrix.first.count
  
  rows.times do |idx|
    row = []
    matrix.reverse.each { |arr| row << arr[idx] } 
    result << row
  end
  
  result
end

def rotate_matrix(matrix, n)
  result = matrix
  
  (n / 90).times do 
    result = rotate90(result)
  end
  
  result
end


# superfluous additional turns:
# def rotate180(matrix)
#   matrix.map { |row| row.reverse }.reverse
# end

# def rotate270(matrix)
#   result = []
#   new_rows = matrix[0].count
#   new_columns = matrix.count
#   new_rows.times { result << [] }

#   new_rows.times do |rowidx|
#     new_columns.times do |colidx|
#       result[rowidx][colidx] = matrix[colidx][rowidx] 
#     end
#   end
  
#   result
# end

# def rotate360(matrix)
#   matrix
# end

# def rotate_matrix(matrix, n)
#   case n
#   when 90  then rotate90(matrix)
#   when 180 then rotate180(matrix)
#   when 270 then rotate270(matrix)    
#   when 360 then rotate360(matrix)
#   end 
# end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate_matrix(matrix1, 90)
p rotate_matrix(matrix1, 180)
p rotate_matrix(matrix1, 270)
p rotate_matrix(matrix1, 360)

p rotate_matrix(matrix2, 90)
p rotate_matrix(matrix2, 180)
p rotate_matrix(matrix2, 270)
p rotate_matrix(matrix2, 360)