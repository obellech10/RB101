require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Short long short
problem("Short Long Short")

def short_long_short(str_1, str_2)
  if str_1.length > str_2.length
    str_2 + str_1 + str_2
  else
    str_1 + str_2 + str_1
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
puts ''

# What century is that?
problem("What century is that?")

CENTURY_HASH = {
  '1': 'st', '2': 'nd', '3': 'rd', '4': 'th', '5': 'th',
  '6': 'th', '7': 'th', '8': 'th', '9': 'th', '0': 'th'
}

def century(year)
  if year % 100 == 0
    century = (year / 100).to_s
  else
    century = (year / 100 ).next.to_s
  end
  century + century_suffix(century)
end

def century_suffix(century)
  if century.end_with?('11', '12', '13')
    suffix = 'th'
  else
    suffix = CENTURY_HASH[century[-1].to_sym]
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
puts ''

# Leap Years Part 1
problem("Leap Years Part 1")

def leap_year?(year)
  # if year % 4 == 0 && year % 400 == 0
  if year % 4 == 0 && year % 100 != 0
    true
  # elsif year % 4 == 0 && year % 100 != 0
  elsif year % 4 == 0 && year % 400 == 0
    true
  else
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
puts ''

# Leap Years Part 2
problem("Leap Years Part 2")

def british_leap_year?(year)
  return true if year < 1752 && year % 4 == 0

  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 4 == 0 && year % 400 == 0
    true
  else
    false
  end
end

puts british_leap_year?(2016) == true
puts british_leap_year?(2015) == false
puts british_leap_year?(2100) == false
puts british_leap_year?(2400) == true
puts british_leap_year?(240000) == true
puts british_leap_year?(240001) == false
puts british_leap_year?(2000) == true
puts british_leap_year?(1900) == false
puts british_leap_year?(1752) == true
puts british_leap_year?(1700) == true
puts british_leap_year?(1) == false
puts british_leap_year?(100) == true
puts british_leap_year?(400) == true
puts ''

# Multiples of 3 and 5
problem("Multiples of 3 and 5")

def multisum(max_value)
  # multiples_array = []
  multiples_array = (1..max_value).select do |num|
    # multiples_array << num if num % 3 == 0 || num % 5 == 0
    num % 3 == 0 || num % 5 == 0
  end
  multiples_array.uniq.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts ''

# Running Totals
problem('Running Totals')

def running_total(array)
  subtotal = 0
  array.map do |integer|
    subtotal += integer
  end
end


puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
puts ''

# Converting a string to a number
problem("Converting a string to a number")

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each do |digit|
    value = 10 * value + digit
  end
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
puts ''

# Convert a string to a signed number
problem("Convert a string to a signed number")

def string_to_signed_integer(string)
  # unsigned_str = string.sub(/[-+]/, '')
  # integer = string_to_integer(unsigned_str)
  integer = string_to_integer(string.delete('-+'))
  string.include?('-') ? -integer : integer
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
puts ''

# Convert a number to a string!
problem("Convert a number to a string!")

DIGITS_ARRAY = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.abs.divmod(10)
    result.prepend(DIGITS_ARRAY[remainder])
    break if number == 0
  end
  result
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
puts integer_to_string(-431) == '431'
puts ''

# Convert a signed number to a string!
problem("Convert a signed number to a string!")

def signed_integer_to_string(integer)
  string = integer_to_string(integer)
  if integer > 0
    string.prepend('+')
  elsif integer < 0
    string.prepend('-')
  else
    string
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
puts ''
