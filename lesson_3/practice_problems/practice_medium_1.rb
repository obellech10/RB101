require 'pry'

def clear
  system('clear') || system('cls')
end

clear

puts "Question 1"
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
puts ''

puts "Question 2"
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"
puts ''

puts "Question 3"
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(10)
puts factors(0)
puts ''

puts "Question 5"
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
puts ''

puts "Question 7"
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
p munsters
puts ''

puts "Question 8"
