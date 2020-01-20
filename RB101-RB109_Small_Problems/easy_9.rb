require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Welcome Stranger
problem("Welcome Stranger")

def greetings(name, details)
  puts "Hello, #{name.join(' ')}! Nice to have a #{details[:title]}" \
       " #{details[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
puts ''

# Double Doubles
problem("Double Doubles")

def double_number?(num)
  size = num.to_s.length
  midpoint = size / 2
  if size == 2
    size.even? && num.to_s[0] == num.to_s[-1]
  else
    size.even? && num.to_s[0, midpoint] == num.to_s[midpoint, midpoint]
  end
end

def twice(number)
  if double_number?(number)
    number
  else
    number * 2
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
puts ''

# Always Return Negative
problem("Always Return Negative")

def negative(num)
  num > 0 ? -num : num
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0
puts

# Counting Up
problem("Counting Up")

def sequence(num)
  (1..num).map { |num| num }
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-1) == [1, 0, -1]
puts

# Uppercase Check
problem("Uppercase Check")

# def uppercase?(string)
#   letters_only = string.chars.select do |char|
#     char =~ /[a-z]/i
#   end
#   letters_only.all? {|char| char =~ /[A-Z]/}
# end

def uppercase?(string)
  string == string.upcase
end

# string.gsub(/[^a-z]/, '2')

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
puts

# How long are you?
problem("How long are you?")

def word_lengths(string)
  string.split.map do |word|
    "#{word} #{word.size}"
  end
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
puts word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
puts word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
puts word_lengths("") == []
puts

# Name Swapping
problem("Name Swapping")

def swap_name(string)
  name = string.split
  "#{name[1]}, #{name[0]}"
end

# Launch School Solution
# def swap_name(name)
#   name.split(' ').reverse.join(', ')
# end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
puts

# Sequence Count
problem("Sequence Count")

def sequence(count, first_num)
  sequence_array = []
  multiples = first_num
  loop do
    break if sequence_array.size == count
    sequence_array << multiples
    multiples += first_num
  end
  sequence_array
end

# Launch School Solution
# def sequence(count, first)
#   (1..count).map { |value| value * first }
# end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
puts

# Grade Book
problem("Grade Book")

def get_grade(score_1, score_2, score_3)
  avg_score = (score_1 + score_2 + score_3) / 3

  case avg_score
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts ''

# Grocery List
problem("Grocery List")

def buy_fruit(list)
  fruit_list = []
  list.map do |item|
  fruit, qty = item[0, 2]
  qty.times {fruit_list << fruit}
  end
  fruit_list
end

# What I was initially trying to do but was missing having two block parameters
# def buy_fruit(list)
#   list.map do |fruit, qty|
#     [fruit] * qty
#   end.flatten
# end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
puts
