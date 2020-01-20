require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Sum of Sums
problem("Sum of Sums")

def sum_of_sums(array)
  total_sum = 0
  multiplier = array.size

  array.each do |num|
    total_sum += num * multiplier
    multiplier -= 1
  end

  total_sum
end

# Launch School solution
# def sum_of_sums(numbers)
#   sum_total = 0
#   accumulator = 0
#
#   numbers.each do |num|
#     accumulator += num
#     sum_total += accumulator
#     binding.pry
#   end
#
#   sum_total
# end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
puts ''

# Madlibs
# problem("Madlibs")
#
# puts "Enter a noun:"
# noun = gets.chomp
# puts "Enter a verb:"
# verb = gets.chomp
# puts "Enter an adjective:"
# adjective = gets.chomp
# puts "Enter a adverb:"
# adverb = gets.chomp
# puts ''
# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
# puts ''

# Leading Substrings
problem("Leading Substrings")

def substrings_at_start(string)
  substrings = []
  length = string.length
  loop do
    break if length == 0
    substrings << string.slice(0, length)
    length -= 1
  end
  substrings.sort
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
puts ''

# All Substrings
problem("All Substrings")

def substrings(string)
  idx = 0
  all_substrings = []
  loop do
    all_substrings << substrings_at_start(string[idx..-1])
    idx += 1
    break if idx == string.length
  end
  all_substrings.flatten
end

# Alternate Solution from different student
# def substrings(string)
#   string.chars.map.with_index do |_,idx|
#     substrings_at_start(string[idx..-1])
#   end.flatten
# end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
puts ''

# Palindromic Substrings
problem("Palindromic Substrings")

def palindrome?(param)
  param == param.reverse if param.length >1
end

# Further Exploration - Can be used to ignore non-alphanumeric and case
# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   palindrome?(string)
# end

def palindromes(string)
  substrings(string).select do |sub_string|
    palindrome?(sub_string)
    # real_palindrome?(sub_string) - method to ignore non-alphanumeric and case
  end
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
puts ''

# Fizzbuzz
problem("Fizzbuzz")

def fizzbuzz(num_start, num_end)
  (num_start..num_end).each do |num|
    if num % 3 == 0 && num % 5 == 0
      puts "Fizzbuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
puts ''

# Repeater
problem("Repeater")

def repeater(string)
  string.chars.map { |letter| letter * 2 }.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
puts ''

# Double Char (Part 2)
problem("Double Char (Part 2)")

def double_consonants(string)
  string.chars.map do |char|
    # if char =~ /[A-Za-z]/ && char =~ /[^aeiou]/
    if char =~ /[a-z&&[^aeiou]]/i # more condensed version or above line
      char * 2
    else
      char
    end
  end.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
puts ''

# Convert number to reversed array of digits
problem("Convert number to reversed array of digits")

def reversed_number(number)
  number.digits.join.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
puts ''

# Get The Middle Character
problem("Get The Middle Character")

def center_of(string)
  center_index = string.length / 2
  case
  when string.length.odd?
    string[center_index]
  when string.length.even?
    string[center_index - 1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
puts ''
