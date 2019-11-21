require 'pry'

def clear
  system('clear') || system('cls')
end

clear

puts "Practice Problem 1"
arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |a,b|
  b.to_i <=> a.to_i
end

p sorted_arr
puts ''

puts "Practice Problem 2"
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |book|
  book[:published]
end

p sorted_books
puts ''

puts "Practice Problem 3"
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].keys[0]
puts ''

puts "Practice Problem 4"
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
p arr1
puts ''
arr2[2] = 4
p arr2
puts ''
hsh1[:first][2][0] = 4
p hsh1
puts ''
hsh2[['a']][:a][2] = 4
p hsh2
puts ''

puts "Practice Problem 5"
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_age = 0
munsters.each_value do |details|
  if details["gender"] == "male"
    male_age += details["age"]
  end
end

p male_age
puts ''

puts "Practice Problem 6"
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end
puts ''

puts "Practice Problem 7"
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr
p a
p b
puts ''

puts "Practice Problem 8"
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w[a e i o u]
hsh.each do |key, value|
  value.each do |string|
    string.chars.each do |letter|
      p letter if vowels.include?(letter)
    end
  end
end
puts ''

puts "Practice Problem 9"
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |sub_array|
  sub_array.sort {|a,b| b <=> a }
end

p sorted_arr
puts ''

puts "Practice Problem 10"
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = []
arr.map do |hash|
  new_arr << hash
  hash.map do |key, value|
    hash[key] = value + 1
  end
end

p new_arr
puts ''

puts "Practice Problem 11"
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

odd_arr = arr.map do |sub_arr|
  sub_arr.select do |integer|
    integer % 3 == 0
  end
end

p odd_arr
puts ''

puts "Practice Problem 12"
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = {}
arr.each do |element|
  hash[element[0]] = element[1]
end

p hash
puts ''

puts "Practice Problem 13"
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sort_by_odd = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

p sort_by_odd
puts ''

puts "Practice Problem 14"
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

produce_array = hsh.map do |produce, details|
  if details[:type] == 'fruit'
    details[:colors].map {|color| color.capitalize}
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end

p produce_array
puts ''
puts "Practice Problem 15"
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_hash = arr.select do |hash|
  hash.all? do |_, value|
    value.all? {|num| num.even?}
  end
end

p even_hash
puts ''

puts "Practice Problem 16"
# 8-4-4-4-12

def generate_uuid
  random_char = Array('a'..'z') + Array(1..10)

  first_section = Array.new(8) { random_char.sample }.join
  second_section = Array.new(4) { random_char.sample }.join
  third_section = Array.new(4) { random_char.sample }.join
  fourth_section = Array.new(4) { random_char.sample }.join
  fifth_section = Array.new(12) { random_char.sample }.join

  puts "#{first_section}-#{second_section}-#{third_section}-#{fourth_section}-#{fifth_section}"
end

generate_uuid

puts ''
