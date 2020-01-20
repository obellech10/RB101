require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Cute Angles
problem("Cute Angles")

DEGREE = "\xC2\xB0"

def dms(angle)
  degrees, min_remainder = angle.divmod(1)
  minutes, sec_remainder = (min_remainder * 60).divmod(1)
  seconds, not_used = (sec_remainder * 60).divmod(1)
  format(%(#{degrees}\xC2\xB0%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00") # Rounding as our solution is off by a sec
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts ''

# Delete Vowels
problem("Delete Vowels")

def remove_vowels(message)
  message.map do |string|
    string.delete("aeiouAEIOU")
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
puts ''

# Fibonacci Number Location by Length
problem("Fibonacci Number Location by Length")

def find_fibonacci_index_by_length(number_length)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_length

    first = second
    second = fibonacci
  end
  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
# puts find_fibonacci_index_by_length(1000) == 4782
# puts find_fibonacci_index_by_length(10000) == 47847
puts ''

# Reversed Arrays Part 1
problem("Reversed Arrays Part 1")

def reverse!(array)
  return array if array.empty?
  temp_array = []
  loop do
    temp_array << array.pop
    break if array.empty?
  end
  loop do
    array << temp_array.shift
    break if temp_array.empty?
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]

list = ['abc']
puts reverse!(list) == ["abc"]
puts list == ["abc"]

list = []
puts reverse!(list) == []
puts list == []
puts ''

# Reversed Arrays Part 2
problem("Reversed Arrays Part 2")

def reverse(array)
  new_array = []
  array.each do |element|
    new_array.prepend(element)
  end
  new_array
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
puts ''

# Combining Arrays
problem("Combining Arrays")

def merge(arr_1, arr_2)
  arr_1.concat(arr_2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts ''

# Halvsies
problem("Halvsies")

def halvsies(array)
  first_arr = []
  second_arr = []
  index = (array.size / 2)
  first_index = (array.size.to_f / 2).ceil(0)
  second_index = -(array.size.to_f / 2).floor(0)

  loop do
    break if first_index == 0
    first_arr[first_index - 1] = array[first_index - 1]
    first_index -= 1
  end

  loop do
    break if second_index == 0
    second_arr[second_index + index] = array[second_index]
    second_index += 1
  end

  [first_arr, second_arr]
end

# Launch School Solution
# def halvsies(array)
#   middle = (array.size / 2.0).ceil
#   first_half = array.slice(0, middle)
#   second_half = array.slice(middle, array.size - middle)
#   [first_half, second_half]
# end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
puts ''

# Find the Duplicate
problem("Find the Duplicate")

def find_dup(array)
  counts = Hash.new(0)
  array.each_with_index do |element|
    counts[element] = array.count(element)
  end

  counts.key(2)
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
puts ''

# Does my list include this?
problem("Does my list include this?")

def include?(array, value)
  array.any? { |element| value == element}
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
puts ''

# Right Triangles
problem("Right Triangles")

def triangle(size)
  spaces = size - 1
  stars = 1
  loop do
    puts (" " * spaces) + ("*" * stars)
    spaces -= 1
    stars += 1
    break if stars > size
  end
end

triangle(5)
puts ''
triangle(9)
puts ''
