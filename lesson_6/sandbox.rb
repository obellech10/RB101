require 'pry'
system 'clear'

PRODUCTS = [
  {name: "Thinkpad x210", price: 220},
  {name: "Thinkpad x220", price: 250},
  {name: "Thinkpad x250", price: 979},
  {name: "Thinkpad x230", price: 300},
  {name: "Thinkpad x230", price: 330},
  {name: "Thinkpad x230", price: 350},
  {name: "Thinkpad x240", price: 700},
  {name: "Macbook Leopard", price: 300},
  {name: "Macbook Air", price: 700},
  {name: "Macbook Pro", price: 600},
  {name: "Macbook", price: 1449},
  {name: "Dell Latitude", price: 220},
  {name: "Dell Latitude", price: 650},
  {name: "Dell Inspiron", price: 300},
  {name: "Dell Inspiron", price: 450}
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: "dell"
}

def search(query)
  PRODUCTS.select do |hash|
    if hash[:name].downcase.include?(query[:q])
      if hash[:price] >= query[:price_min] && hash[:price] <= query[:price_max]
        hash
      end
    end
  end
end

puts search(query) == [{name: "Thinkpad x220", price: 250}]
puts search(query2) == [
  {name: "Dell Inspiron", price: 300},
  {name: "Dell Inspiron", price: 450}]


puts
# Find substrings in a string

def substring(string, start_index, end_index = nil)
  return string[start_index] if !end_index
  string[start_index..end_index]
end

puts substring("honey", 0, 2) == 'hon'
puts substring("honey", 1, 2) == 'on'
puts substring("honey", 3, 9) == 'ey'
puts substring("honey", 2) == 'n'
puts

# Find all substrings from a string, no 1 letter words

def substrings(string)
  result = []
  start_index = 0
  loop do
    end_index = start_index + 1
    loop do
      break if end_index == string.length

      result << substring(string, start_index, end_index)
      end_index += 1
    end
    start_index += 1

    break if start_index == string.length
  end
  result
end

puts substrings("band") == ["ba", "ban", "band", "an", "and", "nd"]
puts substrings("world") == ["wo", "wor", "worl", "world", "or", "orl", "orld",
  "rl", "rld", "ld"]
puts substrings("ppop") == ["pp", "ppo", "ppop", "po", "pop", "op"]
puts

# return all palindromes in a string

def palindromes(string)
  all_substrings = substrings(string)
  all_substrings.select do |substring|
    substring == substring.reverse
  end
end

puts palindromes("ppop") == ["pp", "pop"]
puts palindromes('madam') == ['madam', 'ada']
puts

# find largest palindrome substring within a string

def largest_palindrome(string)
  all_palindromes = palindromes(string)
  all_palindromes.max { |a, b| a.length <=> b.length }
end

puts largest_palindrome("ppop") == "pop"
puts largest_palindrome("madam") == "madam"
puts

# Method that will generate random english math problems

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(num_of_operations)
  result = []
  counter = num_of_operations
  loop do
    result << NUMBERS.sample
    result << OPERATORS.sample
    result << NUMBERS.sample if counter == 1
    counter -= 1
    break if counter == 0
  end
  result.join(" ").gsub("divided", "divided by")
end

p mathphrase(1) # => "five minus two"
p mathphrase(2) # => "five minus two times eight"
p mathphrase(3) # => "five minus two divided one plus two"
puts

def random_mathphrase(number_of_phrases)
  operations = (1..20).to_a
  number_of_phrases.times { |_| p mathphrase(operations.sample) }
end

random_mathphrase(3)
puts

# Reverse the Odd Words in a string

def reverse_odd_words(string)
  reversed_result = []
  return string if string.empty?
  string.delete(".").split.map.with_index do |word, index|
    index.odd? ? reversed_result << word.reverse : reversed_result << word
    # Code below is if "." ever appears within the middle of string argument
    # next reversed_result[index-1] += word if word == '.'
    # if index.odd? && word.include?(".")
    #   reversed_result << word.chop.reverse + "."
    # elsif index.odd?
    #   reversed_result << word.reverse
    # else
    #   reversed_result << word
    # end
  end
  reversed_result.join(" ").concat(".")
end

p reverse_odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p reverse_odd_words("hello.") == "hello."
p reverse_odd_words("hello .") == "hello."
p reverse_odd_words("hello world.") == "hello dlrow."
p reverse_odd_words("hello world .") == "hello dlrow."
p reverse_odd_words("hello  hello world.") == "hello olleh world."
p reverse_odd_words("") == ""
puts

# Select element from array if it's index is a fibonacci number

def fibonacci_numbers(max_number_of_elements)
  fibonacci_num_array = [1]
  total = 0
  num_1 = 1
  num_2 = 0
  counter = 1
  loop do
    total = num_1 + num_2
    num_2 = num_1
    num_1 = total
    fibonacci_num_array << total
    counter += 1
    break if counter == max_number_of_elements
  end
  fibonacci_num_array
end

p fibonacci_numbers(6) == [1, 1, 2, 3, 5, 8]
p fibonacci_numbers(8) == [1, 1, 2, 3, 5, 8, 13, 21]
p fibonacci_numbers(4) == [1, 1, 2, 3]
puts

def select_element_if_index_fibonacci(array)
  fibonacci_array = fibonacci_numbers(array.length)
  fibonacci_elements = []
  array.each_with_index do |number, index|
    fibonacci_elements << number if fibonacci_array.include?(index)
    # if fibonacci?(index, array.length)
    #   fibonacci_elements << number
    # end
  end
  fibonacci_elements
end

p select_element_if_index_fibonacci([1, 4, 5, 9, 12, 44]) == [4, 5, 9, 44]
p select_element_if_index_fibonacci([1, 4, 5, 9, 12]) == [4, 5, 9]
p select_element_if_index_fibonacci([9, 54, 57, 29, 12, 44, 32, 76]) == [54, 57, 29, 44]
p select_element_if_index_fibonacci([3, 35, 76, 9]) == [35, 76, 9]
