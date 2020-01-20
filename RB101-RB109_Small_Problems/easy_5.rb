require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

# ASCII string value
problem("ASCII string value")

def ascii_value(string)
  total = 0
  string.each_char do |char|
    total += char.ord
  end
  total
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
puts ''
puts 'Further Exploration'
char = 'a'
puts char.ord.chr == char
# if used on a string longer than a single char the method char.ord.chr will
# only return the first letter of that string
puts ''

# After Midnight Part 1
problem('After Midnight Part 1')

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-120) == "22:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
puts ''

# After Midnight Part 2
problem("After Midnight Part 2")

def before_midnight(string)
  # hour = string[0, 2].to_i
  minutes = (string[0, 2].to_i) * 60
  minutes += string[3, 2].to_i
  # minutes += hour * 60

  if minutes == 0
    min_before = 0
  else
    min_before = 1440 - minutes
  end
  min_before
end

def after_midnight(string)
  minutes = (string[0, 2].to_i) * 60
  minutes += string[3, 2].to_i

  if minutes == 0 || minutes == 1440
    min_after = 0
  else
    min_after = minutes
  end
  min_after
end

# Lanuch School solutions for these methods
# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
#
# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end
#
# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
puts ''

# Letter swap
problem("Letter Swap")
def swap(string)
  array = string.split(' ')
  letter_swap = array.map do |word|
    if word.length == 1
      word
    elsif word.length > 2
      first = word.slice!(0)
      last = word.slice!(-1)
      (last + word + first)
    else
      first = word.slice!(0)
      last = word.slice!(-1)
      (last + first)
    end
  end
  letter_swap.join(' ')
end

# Launch School solution
# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end
#
# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
puts ''

# Clean up the words
problem('Clean up the words')
ALPHABETIC = ('a'..'z')

def cleanup(string)
  array = string.split('')
  clean_array = array.map do |char|
    if ALPHABETIC.include?(char)
      char
    else
      ' '
    end
  end
  clean_array.join.squeeze(' ')
end

# Launch school solution
# def cleanup(text)
#   text.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end

puts cleanup("---what's my +*& line?") == ' what s my line '
puts ''

# Letter Counter Part 1
problem("Letter Counter Part 1")

def word_sizes(string)
  word_array = string.split(' ')
  word_counts = Hash.new(0)
  word_array.each do |word|
    word_counts[word.length] += 1
  end
  word_counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
puts ''

# Letter Counter Part 2
problem("Letter Counter Part 2")

def word_sizes_2(string)
  word_array = string.split(' ')
  word_counts = Hash.new(0)
  word_array.each do |word|
    word.delete!('^a-zA-Z')
    word_counts[word.length] += 1
  end
  word_counts
end

puts word_sizes_2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes_2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes_2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes_2('') == {}
puts ''

# Alphabetical numbers
problem("Alphabetical numbers")

ALPHA_NUMBERS = {
  0=>'zero', 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five', 6=>'six',
  7=>'seven', 8=>'eight', 9=>'nine', 10=>'ten', 11=>'eleven', 12=>'twelve',
  13=>'thirteen', 14=>'fourteen', 15=>'fifteen', 16=>'sixteen', 17=>'seventeen',
  18=>'eighteen', 19=>'nineteen'
}

def alphabetic_number_sort(num_array)
  num_words = num_array.map do |int_num|
    ALPHA_NUMBERS[int_num]
  end
  sorted_array = []
  num_words.sort.map do |word_num|
    sorted_array << ALPHA_NUMBERS.key(word_num)
  end
  sorted_array
end

# Launch School solution
# NUMBER_WORDS = %w(zero one two three four
#                   five six seven eight nine
#                   ten eleven twelve thirteen fourteen
#                   fifteen sixteen seventeen eighteen nineteen)
#
# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number] }
# end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
puts ''

# Daily Double
problem("ddaaiillyy ddoouubbllee")

def crunch(string)
  index = 0
  dups_removed = string
  loop do
    break if index >= dups_removed.length
    if dups_removed[index] == dups_removed[index + 1]
      dups_removed.slice!(index + 1)
    else
      index += 1
    end
  end
  dups_removed
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
puts ''

# Bannerizer
problem("Bannerizer")

def print_in_box(message)
  dashes = '-' * message.length
  spaces = ' ' * message.length
  puts "+-#{dashes}-+"
  puts "| #{spaces} |"
  puts "| #{message} |"
  puts "| #{spaces} |"
  puts "+-#{dashes}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
puts ''
