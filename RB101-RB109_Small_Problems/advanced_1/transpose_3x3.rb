require 'pry'
system 'clear'

def transpose(array)
  matrix = []
  index = 0
  loop do
    break if index >= array.size
    matrix << array.map {|element| element[index]}
    index += 1
  end
  matrix
end

# Further Exploration
def transpose!(array)
  matrix = array.clone
  index = 0
  loop do
    break if index >= array.size
    array[index] = matrix.map {|element| element[index]}
    index += 1
  end
  array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p matrix
puts


new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix != [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p matrix
