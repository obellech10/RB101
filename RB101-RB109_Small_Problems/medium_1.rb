require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Rotation (Part 1)
problem("Rotation (Part 1)")

def rotate_array(array)
  rotated_arr = []
  array.each_with_index do |element, idx|
    if idx == 0
      rotated_arr[0] = array[idx]
    else
      rotated_arr.prepend(array[-idx])
    end
  end
  rotated_arr
end

# Launch School Solution - might have over thought my solution
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']
puts
puts x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true
puts

problem("Rotate String")

def rotate_string(string)
  char_array = string.chars
  rotate_array(char_array).join
  # (char_array[1..-1] + [char_array[0]]).join
end

puts rotate_string('flower') == 'lowerf'
puts rotate_string('abcde') == 'bcdea'
puts

problem("Rotate Integers")

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

puts rotate_integer(45542) == 55424
puts rotate_integer(12345) == 23451
puts

# Rotation Part 2
problem("Rotation Part 2")

def rotate_rightmost_digits(integer, rindex)
  array = integer.to_s.chars
  digit_to_rotate = array.delete_at(-rindex)
  array << digit_to_rotate
  array.join.to_i
end

# Launch School Solution - Here they used the previous rotate_array method
# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   all_digits.join.to_i
# end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
puts

# Rotation Part 3
problem("Rotation Part 3")

def max_rotation(integer)
  rindex = integer.to_s.length
  # rotated_integer = integer - not neccessary to set equal to another var
  integer.to_s.length.times do
    integer = rotate_rightmost_digits(integer, rindex)
    rindex -= 1
  end
  integer
end

# Launch School Solution
# def max_rotation(number)
#   number_digits = number.to_s.size
#   number_digits.downto(2) do |n|
#     number = rotate_rightmost_digits(number, n)
#   end
#   number
# end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
puts

# 1000 Lights
problem("1000 Lights")

def switches_on(switches)
  hash = Hash.new
  1.upto(switches) do |switch|
    hash[switch] = 'no'
  end

  demoninator = 1
  loop do
    hash.each do |switch, state|
      state.reverse! if switch % demoninator == 0
    end
    break if demoninator == switches
    demoninator += 1
  end
  hash.select { |_switch, state| state == 'on' }.keys
end

puts switches_on(5) == [1, 4]
puts switches_on(10) == [1, 4, 9]
puts

# Diamonds
problem("Diamonds")

def diamond(size)
  stars = "*"
  loop do
    puts stars.center(size)
    break if stars.length == size
    stars << "**"
  end
  loop do
    break if stars.length == 1
    stars = stars.chomp("**")
    puts stars.center(size)
  end
end

# Launch School Solution
# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - (2 * distance_from_center)
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end
#
# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

diamond(1)
puts
diamond(3)
diamond(9)
puts

# Stack Machine Interpretation
problem("Stack Machine Interpretation")

def minilang(programs)
  register = 0
  stack = []
  programs.split.each do |command|
    case command
    when 'PUSH' then stack << register
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else register = command.to_i
    end
  end
end

minilang('PRINT')
# 0
puts
minilang('5 PUSH 3 MULT PRINT')
# 15
puts
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts
minilang('5 PUSH POP PRINT')
# 5
puts
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts
minilang('6 PUSH')
# (nothing printed; no PRINT commands)
puts

# Word to Digit
problem("Word to Digit")

DIGITS_HASH = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

# def word_to_digit(string)
#   binding.pry
#   string.split.map do |word|
#     DIGITS_HASH.has_key?(word.to_sym) ? DIGITS_HASH[word.to_sym] : word
#   end.join(' ')
# end

def word_to_digit(words)
  DIGITS_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGITS_HASH[word])
  end
  words
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts

# Fibonacci Numbers (Recursion)
problem("Fibonacci Numbers (Recursion)")

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
puts

# Fibonacci Numbers (Procedural)
problem("Fibonacci Numbers (Procedural)")

def fibonacci_2(number)
  total = 0
  num_1 = 1
  num_2 = 0
  counter = 1
  loop do
    total = num_1 + num_2
    num_2 = num_1
    num_1 = total
    counter += 1
    break if counter == number
  end
  total
end

# Launch School Solution
# def fibonacci_2(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end
#   last
# end

puts fibonacci_2(3) == 2
puts fibonacci_2(20) == 6765
puts fibonacci_2(100) == 354224848179261915075
# puts fibonacci_2(100_001) # => 4202692702.....8285979669707537501
puts

# Fibonacci Numbers (Last Digit)
problem("Fibonacci Numbers (Last Digit)")

# def fibonacci_last(number)
#   fibonacci_2(number).to_s.slice(-1).to_i
# end

# Launch School Solution
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

puts fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
# puts fibonacci_last(123456789) == 4 # -> 4
puts
