# Question 5
puts (10..100).include?(42)
puts ''

# Question 6
famous_words = "seven years ago..."

puts "Four score and " + famous_words
puts famous_words.insert(0, "Four score and ")
puts ''

# Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!
p flintstones

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.slice("Barney").to_a.flatten
p flintstones.assoc("Barney") # a lot cleaner way to get the same outcome as above
