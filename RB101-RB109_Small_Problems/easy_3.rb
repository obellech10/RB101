require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# # Searching 101
# problem("Searching 101")
#
# ord = ['1st', '2nd', '3rd', '4th', '5th', 'last']
# num_array = []
# number = nil
#
# ord.each do |position|
#   if position == 'last'
#     puts "Enter the #{position} number:"
#     number = gets.chomp.to_i
#   else
#     puts "Enter the #{position} number:"
#     num_array << gets.chomp.to_i
#   end
# end
#
# if num_array.include?(number)
#   puts "The number #{number} appears in #{num_array}."
# else
#   puts "The number #{number} does not appear in #{num_array}."
# end
# puts ''
#
# # Arithmetic Integer
# problem("Arithmetic Integer")
#
# puts "Enter the first number:"
# int_1 = gets.chomp.to_i
# puts "Enter the second number:"
# int_2 = gets.chomp.to_i
#
# puts "=> #{int_1} + #{int_2} = #{int_1 + int_2}"
# puts "=> #{int_1} - #{int_2} = #{int_1 - int_2}"
# puts "=> #{int_1} * #{int_2} = #{int_1 * int_2}"
# puts "=> #{int_1} / #{int_2} = #{int_1 / int_2}"
# puts "=> #{int_1} % #{int_2} = #{int_1 % int_2}"
# puts "=> #{int_1} ** #{int_2} = #{int_1 ** int_2}"
# puts ''
#
# # Counting the number of characters
# problem("Counting the number of characters")
#
# puts "Please write word or multiple words:"
# words = gets.chomp
#
# # words_array = words.delete(' ').chars
# words_count = words.delete(' ').size
#
# # puts "There are #{words_array.count} characters in \"#{words}\"."
# puts "There are #{words_count} characters in \"#{words}\"."
# puts ''
#
# Multiply two numbers
problem("Multiply two numbers")

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15
p multiply([5, 2], 3)
puts ''

# Square an argument
problem("Square an argument")

def square(number)
  multiply(number, number)
end

puts square(5) == 25
puts square(-8) == 64
puts ''

problem("Power the number")
def power(number, power)
  multiply(number, 1) ** power
end

puts power(5, 3) == 125
puts ''

# Exclusive Or
problem("Exclusive Or")

def xor?(cond_1, cond_2)
  return false if cond_1 && cond_2
  return true if cond_1 || cond_2
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
puts ''

# Odd lists
problem("Odd lists")

# def oddities(array)
#   odd_element_array = []
#   array.each_with_index do |element, idx|
#     odd_element_array << element if idx.even?
#   end
#   odd_element_array
# end

def oddities(array)
  odd_element_array = []
  index = 0
  loop do
    break if index >= array.size
    odd_element_array << array[index] if index.even?
    index += 1
  end
  odd_element_array
end

test_array = [2, 3, 4, 5, 2, 7]

puts oddities(test_array) == [2, 4, 2]
p test_array
puts ''
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
puts ''

# Even lists
problem("Even lists")

def normalcy(array)
  even_element_array = []
  array.each_with_index do |element, idx|
    even_element_array << element if idx.odd?
  end
  even_element_array
end

puts normalcy([2, 3, 4, 5, 6]) == [3, 5]
puts normalcy([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts normalcy(['abc', 'def']) == ['def']
puts normalcy([123]) == []
puts normalcy([]) == []
puts ''

# Palindromic strings
problem("Palindromic strings")

# def palindrome_string?(string)
#   string == string.reverse
# end
#
# def palindrome_array?(array)
#   array == array.reverse
# end

def palindrome?(param)
  param == param.reverse
end

# puts palindrome_string?('madam') == true
# puts palindrome_string?('Madam') == false          # (case matters)
# puts palindrome_string?("madam i'm adam") == false # (all characters matter)
# puts palindrome_string?('356653') == true
# puts ''
# puts palindrome_array?([1, 2, 3, 2, 1]) == true
# puts palindrome_array?([1, 2, 3, 3, 1]) == false
# puts palindrome_array?([[1, 2], 3, [2, 1]]) == false
# puts palindrome_array?([[1, 2], 3, [1, 2]]) == true
# puts ''
puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1, 2, 3, 2, 1]) == true
puts palindrome?([1, 2, 3, 3, 1]) == false
puts palindrome?([[1, 2], 3, [2, 1]]) == false
puts palindrome?([[1, 2], 3, [1, 2]]) == true
puts ''

# Palindromic strings part 2
problem("Palindromic strings part. 2")
ALPHANUMERIC_RANGE = (97..122)

# def real_palindrome?(param)
#   param_array = param.downcase.delete(' ').chars
#   param_array.select do |char|
#     param_array.delete(char) if !ALPHANUMERIC_RANGE.include?(char.ord)
#   end
#   palindrome?(param_array.join)
# end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
puts ''

# Palindromic strings part 3
problem("Palindromic strings part 3")

def palindromic_number?(number)
  binding.pry
  number.to_s == number.to_s.reverse
  # palindrome?(number.to_s)
end

# puts palindromic_number?(34543) == true
# puts palindromic_number?(123210) == false
# puts palindromic_number?(22) == true
# puts palindromic_number?(5) == true
puts palindromic_number?(050) == true
puts ''
