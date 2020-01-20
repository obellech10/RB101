require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Combine Two Lists
problem("Combine Two Lists")

def interleave(arr_1, arr_2)
  index = 0
  combined_array = []
  loop do
    combined_array << arr_1[index]
    combined_array << arr_2[index]
    index += 1
    break if index == arr_1.size
  end
  combined_array
end

# Further Exploration
def interleave_2(arr_1, arr_2)
  arr_1.zip(arr_2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts interleave_2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts ''

# Lettercase Counter
problem("Lettercase Counter")

def letter_case_count(string)
  results = {lowercase: 0, uppercase: 0, neither: 0}

  string.chars.each do |char|
    if ('a'..'z').include?(char)
      results[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      results[:uppercase] += 1
    else
      results[:neither] += 1
    end
  end
  results
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
puts ''

# Capitalize Words
problem("Capitalize Words")

def word_cap(string)
  cap_string = string.split.map do |word|
    word.capitalize
  end
  cap_string.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
puts ''

# Swap Case
problem("Swap Case")

UPPERCASE_ALPHA = ('A'..'Z')
LOWERCASE_ALPHA = ('a'..'z')

def swapcase(string)
  reversed = string.chars.map do |char|
    if UPPERCASE_ALPHA.include?(char)
      char.downcase
    elsif LOWERCASE_ALPHA.include?(char)
      char.upcase
    else
      char
    end
  end
  reversed.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts ''

# Staggered Caps (Part 1)
problem("Staggered Caps (Part 1)")

def staggered_case(message)
  new_string = ''
  message.chars.each_with_index do |char, idx|
    if idx.even?
      new_string << char.upcase
    elsif idx.odd?
      new_string << char.downcase
    end
  end

  new_string
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts ''

# Staggered Caps (Part 2)
problem("Staggered Caps (Part 2)")

def staggered_case_2(message, ignore_non_alpha = true)
  upper_first = true
  ignore_non_alpha
  new_string = ''

  message.chars.map do |char|
    if char =~ /[a-zA-Z]/
      upper_first ? new_string << char.upcase : new_string << char.downcase
      upper_first = !upper_first
    else
      new_string << char
      upper_first = !upper_first if ignore_non_alpha == false
    end
  end
  new_string
end

puts staggered_case_2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case_2('ALL CAPS') == 'AlL cApS'
puts staggered_case_2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
puts staggered_case_2('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'
puts ''

# Multiplicative Average
problem("Multiplicative Average")

def show_multiplicative_average(array)
  format('%.3f', (array.reduce(:*) / array.size.to_f))
end

puts show_multiplicative_average([3, 5]) == "7.500"
puts show_multiplicative_average([6]) == "6.000"
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "28361.667"
puts ''

# Multiply Lists
problem("Multiply Lists")

def multiply_list(arr_1, arr_2)
  products = []
  arr_1.each_with_index do |num, idx|
    products << arr_2[idx] * num
  end
  products
end

# Further Exploration
# def multiply_list(arr_1, arr_2)
#   arr_1.zip(arr_2).map { |num| num.reduce(:*) }
# end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
puts ''

# Multiply All Pairs
problem("Multiply All Pairs")

def multiply_all_pairs(arr_1, arr_2)
  arr_1.product(arr_2).map { |num| num.reduce(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts ''

# The End Is Near But Not Here
problem("The End Is Near But Not Here")

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
puts ''

def middle(string)
  word_array = string.split
  word_array[(word_array.size.to_f / 2).floor(0)]
end

puts middle('Today is great!') == 'is'
puts middle('Tomorrow will be even better!') == 'be'
