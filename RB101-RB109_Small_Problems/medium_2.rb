require 'pry'
require 'date'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# Longest Sentence
problem("Longest Sentence")

text = File.read('sample_text.txt')
# sentences = text.split(/\.|\?|!/)
sentences = text.split(/(?<=[.?!])/) # This now includes punctuation, its' called positive lookbehind
longest_sentence = sentences.max_by do |sentence|
  sentence.split.size
end
longest_sentence = longest_sentence.strip
number_of_words = longest_sentence.split.size

puts "The longest sentence is..."
puts
puts "#{longest_sentence}"
puts
puts "Which has #{number_of_words} words."
puts

# Now I Know My ABCs
problem("Now I Know My ABCs")

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? do |block|
    up_string.count(block) >= 2
  end
end

puts block_word?('BAbCH') == false
puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
puts

problem("Lettercase Percentage Ratio")

def letter_percentages(string)
  counts = {lowercase: 0, uppercase: 0, neither: 0}
  percentages = {lowercase: [], uppercase: [], neither: []}
  characters = string.chars
  size = string.size

  counts[:lowercase] = characters.count { |char| char.match(/[a-z]/) }
  counts[:uppercase] = characters.count { |char| char.match(/[A-Z]/) }
  counts[:neither] = characters.count { |char| char.match(/[^A-Za-z]/) }

  calculate(percentages, counts, size)

  percentages
end

def calculate(percentage, counts, size)
  percentage[:lowercase] = (counts[:lowercase] / size.to_f * 100).round(2)
  percentage[:uppercase] = (counts[:uppercase] / size.to_f * 100).round(2)
  percentage[:neither] = (counts[:neither] / size.to_f * 100).round(2)
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts letter_percentages('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}
puts

problem("Matching Parentheses?")

def balanced?(string)
  parens = 0
  string.chars.each do |char|
    parens += 1 if char.match(/\(|\[|\{/)
    parens -= 1 if char.match(/\)|\]|\}/)
    # parens -= 1 if char == ')'
    break if parens < 0
  end
  parens.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('What [[is]]) up(') == false
puts balanced?('What {((is))} up') == true
puts

problem("Triangle Sides")

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  if sides.uniq.size == 1
    :equilateral
  elsif sides.min(2).sum > sides.max
    sides.uniq.size == 2 ? :isosceles : :scalene
  else
    :invalid
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
puts

problem("Tri-Angles")

def triangle2(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if angles.sum != 180 || angles.include?(0)
  if angles.any? { |angle| angle == 90 }
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

puts triangle2(60, 70, 50) == :acute
puts triangle2(30, 90, 60) == :right
puts triangle2(120, 50, 10) == :obtuse
puts triangle2(0, 90, 90) == :invalid
puts triangle2(50, 50, 50) == :invalid
puts

problem("Unlucky Days")

def friday_13th(year)
  Date.new(year).step(Date.new(year,-1,-1)).select do |day|
    day.friday? && day.mday == 13
  end.size
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
puts

problem("Next Featured Number Higher than a Given Value")

def featured(number)
  multiples = 7
  loop do
    multiples += 7
    return multiples if multiples > number && multiples.odd? && multiples.digits.uniq == multiples.digits
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
  # binding.pry
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
# puts featured(999_999_987) == 1_023_456_987
# puts featured(9_999_999_999)
puts

problem("Bubble Sort")

def bubble_sort!(array)
  loop do
    none_swapped = 0
    array.each_with_index do |element, index|
      if (element <=> array[index + 1]) == 1
        array.delete_at(index)
        array.insert(index + 1, element)
      else
        none_swapped += 1
      end
    end
    break if none_swapped == (array.length - 1)
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts

problem("Square of Sums - Sum of Squares")

def sum_square_difference(integer)
  array_of_numbers = (1..integer).to_a
  square_of_sums = array_of_numbers.sum ** 2
  sum_of_squares = 0

  array_of_numbers.each do |number|
    sum_of_squares += number ** 2
  end

  square_of_sums - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
