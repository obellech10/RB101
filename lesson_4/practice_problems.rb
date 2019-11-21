require 'pry'

def clear
  system('clear') || system('cls')
end

clear

puts "Practice Problem 1"
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.map do |name|
  flintstones_hash[name] = flintstones.index(name)
end

p flintstones_hash
puts ''

puts "Practice Problem 2"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum
puts ''

puts "Practice Problem 3"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.delete_if {|name, age| age >= 100}
puts ''

puts "Practice Problem 4"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min
puts ''

puts "Practice Problem 5"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
first_person = flintstones.find do |name|
  name.start_with?('Be')
end

p flintstones.index(first_person)
p flintstones.index{|name| name[0, 2] == 'Be'} # Much simpler solve and easier to read code
puts ''

puts "Practice Problem 6"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end

p flintstones
puts ''

puts "Practice Problem 7"
statement = "The Flintstones Rock"
letter_count = {}

statement.each_char do |letter|
  next if letter == ' '
  letter_count[letter] = statement.count(letter)
end

p letter_count
puts ''

puts "Practice Problem 8"
numbers = [1, 2, 3, 4]

numbers.each do |number|
  p number
  numbers.shift
end
puts ''

puts "Practice Problem 9"
words = "the flintstones rock"
cap_words = []
words_array = words.split(' ')

words_array.map do |word|
  cap_words << word.capitalize
end

p cap_words.join(' ')
puts ''

puts "Practice Problem 10"
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(person)
  if (0..17).include?(person)
    'kid'
  elsif (18..64).include?(person)
    'adult'
  else
    'senior'
  end
end

munsters.each do |name, stats|
  stats["age_group"] = age_group(stats["age"])
end

# munsters.each do |name, details|
#   case details["age"]
#   when 0...18
#     details["age_group"] = "kid"
#   when 18...65
#     details["age_group"] = "adult"
#   else
#     details["age_group"] = "senior"
#   end
# end

puts munsters
puts ''
