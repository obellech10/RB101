puts "Question 1"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.has_key?("Spot")
puts ages.include?("Spot")
puts ages.member?("Spot")
puts ''

puts "Question 2"
munsters_description = "The Munsters are creepy in a good way."

puts munsters_description
puts ''
# puts munsters_description.upcase.sub('T', 't').sub('M', 'm')
puts munsters_description.swapcase # Easier to read then above

puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase
puts ''

puts "Question 3"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages.merge!(additional_ages)
puts ''

puts "Question 4"
advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?("Dino")
puts ''

puts "Question 5"
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
puts ''

puts "Question 6"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << 'Dino' # Either option works
p flintstones.push('Dino')
puts ''

puts "Question 7"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.push('Dino', 'Hoppy')
p flintstones.push(%w(Dino Hoppy)) # Adds an array instead of each item separately
puts ''

puts "Question 8"
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0..38)
# puts advice.slice!(0, advice.index('house')) index returns the index of the first occurrence of the substring
puts advice
puts ''

puts "Question 9"
statement = "The Flintstones Rock!"
puts statement.count('t')
puts ''

puts "Question 10"
title = "Flintstone Family Members"
puts title.center(40)
puts ''
