require 'pry'
require 'date'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# How old is Teddy?
problem("How old is Teddy?")
def what_age(name)
  name = "Teddy" if name.empty?
  age = rand(20..200)
  puts "#{name.capitalize} is #{age} years old!"
end

puts "Enter a name to get their age."
name = gets.chomp

what_age(name)
puts ''

# How big is the room?
problem("How big is the room?")
SQMETERS_TO_SQFEET = 10.7639

def calculate_area(length, width)
  sq_meters = (length * width).round(2)
  sq_feet = (sq_meters * SQMETERS_TO_SQFEET).round(2)
  puts "The area of the room is #{sq_meters} " + \
       "square meters (#{sq_feet} square feet)."
end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

calculate_area(length, width)
puts ''

# How big is the room? square feet, inches, centimeters
problem("How big is the room in feet, inches, & centimeters")
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.03

def calculate_area_feet(length, width)
  sq_feet = (length * width).round(2)
  sq_inches = (sq_feet * SQFEET_TO_SQINCHES).round(2)
  sq_cm = (sq_feet * SQFEET_TO_SQCM).round(2)
  puts "The area of the room is #{sq_feet} square feet " + \
       "(#{sq_inches} square inches & #{sq_cm} square centimeters)."
end

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f
puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

calculate_area_feet(length, width)
puts ''

# Tip calculator
problem("Tip Calculator")

puts "What is the bill amount?"
bill_amt = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f

def calculate_tip(bill, tip)
  tip_amt = (bill * (tip / 100)).round(2)
  total_amt = (bill + tip_amt).round(2)

  puts "The tip is $#{format("%#.2f", tip_amt)}"
  puts "The total is $#{format("%#.2f", total_amt)}"
end

calculate_tip(bill_amt, tip_percent)
puts ''

# When will I retire?
problem("When will I retire?")

puts "What is your age?"
current_age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_till_retirement = retirement_age - current_age
current_year = Date.today.year
retirement_year = current_year + years_till_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_till_retirement} years of work to go!"
puts ''

# Greeting a user
problem("Greeting a user")
puts "What is your name?"
name = gets.chomp

if name.include?("!")
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end
puts ''

# Odd numbers
problem("Odd Numbers")

(1..99).select { |num| p num if num.odd? }

# Even numbers
problem("Even Numbers")

(1..99).select { |num| p num if num.even? }
puts ''

# Sum or Product of consecutive integers
problem("Sum or Product of consecutive integers")
puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
calculation = gets.chomp

if calculation == 'p'
  # product = 1
  # (1..integer).map do |num|
  #   product *= num
  # end
  product = (1..integer).inject(:*)
  puts "The product of the integers between 1 and #{integer} is #{product}."
elsif calculation == 's'
  # total = 0
  # (1..integer).map do |num|
  #   total += num
  # end
  sum = (1..integer).inject(:+)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else
  puts "Sorry, unknown operation"
end

puts ''

# Mutation
problem("Mutation")

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
puts ''
