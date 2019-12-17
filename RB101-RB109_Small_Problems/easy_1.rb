require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Repeat Yourself
problem("Repeat Yourself")
def repeat(phrase, num)
  num.times { puts phrase }
end

repeat('hello', 3)
puts ''

# Odd
problem("Odd")
# Using the modulo method
# def is_odd?(number)
#   number.abs % 2 != 0
# end

# Using the remainder method
def is_odd?(number)
  number.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts ''

# List of digits
problem("List of digits")
def digit_list(number)
  # number.to_s.split('').map(&:to_i)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts ''

# How many?
problem("How many?")
def count_occurrences(array)
  occurrences = {}

  array.map do |element|
    element.downcase!
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
puts ''

# Reverse it Part 1
problem("Reverse it, part 1")
# def reverse_sentence(message)
#   array = message.split(' ')
#   reverse = []
#   counter = array.count
#   loop do
#     break if counter == 0
#     reverse << array.pop
#     counter -= 1
#   end
#   reverse.join(" ")
# end

def reverse_sentence(message)
  message.split(' ').reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts ''

# Reverse it Part 2
problem("Reverse it, part 2")

def reverse_words(message)
  message_array = message.split(' ')

  message_array.each do |word|
    word.reverse! if word.length >= 5
  end

  message_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts ''

# Stringy Strings
problem("Stringy Strings")

# This was my solution, a little too verbose
# def stringy(size, start_value = 1)
#   num_string = ''
#   counter = 1
#
#   while counter <= size
#     case start_value
#     when 1 then
#       num_string += counter.odd? ? '1' : '0'
#     when 0 then
#       num_string += counter.odd? ? '0' : '1'
#     end
#     counter += 1
#   end
#   num_string
# end

# LS solution
def stringy(size, start_value = 1)
  numbers = [start_value]

  (size - 1).times do |index|
    number = numbers[index].even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

# Fellow LS student solution, very clean
# def stringy(size, start_num=1)
#   digit = start_num == 1 ? '10' : '01'
#   stringy = digit * size
#   stringy[0, size]
# end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(3,0) == '010'
puts stringy(3,1) == '101'
puts ''

# Array Average
problem("Array Average")

def average(numbers)
  (numbers.sum.to_f / numbers.count).round(2)
end

puts average([1, 5, 87, 45, 8, 8]) == 25.67
puts average([9, 47, 23, 95, 16, 52]) == 40.33
puts ''

problem("Sum of Digits")

def sum(integer)
  integer.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
puts ''

problem("What's my bonus?")

def calculate_bonus(salary, bonus_eligible)
  bonus_eligible ? salary * 0.5 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
puts calculate_bonus(50005, true) == 25002.5
puts ''
