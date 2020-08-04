require 'pry'
system 'clear'

def problem(message)
  puts "Problem: #{message}"
end

problem("Countdown")

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
puts

problem("HEY YOU")

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
puts

problem("Valid Series?")

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8]) == true       # should return true
p valid_series?([1, 12, 2, 5, 16, 6]) == false           # should return false
p valid_series?([28, 3, 4, 7, 9, 14]) == false           # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3]) == true       # should return true
p valid_series?([10, 6, 19, 2, 6, 4]) == false           # should return false
puts

problem("Reverse Sentence")

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
puts

problem("Card Deck")

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end
# Determine the score of the remaining cards in the deck

# total_deck_value = cards.map { |card| score(card) }.sum
total_deck_value = 380
player_card_value = player_cards.map { |card| score(card) }.sum

# sum = deck.reduce(0) do |sum, (suit, remaining_cards)|
#   remaining_cards.map! do |card|
#     score(card)
#   end

  # sum += remaining_cards.sum
  sum = total_deck_value - player_card_value
# end

puts sum
puts

problem("Getting Things Done")

def move(n, from_array, to_array)
  to_array << from_array.shift(n)
  to_array.flatten!
  # move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
puts

problem("Neutralizer")

def neutralize(sentence)
  words = sentence.split(' ')
  new_sentence = []
  words.each do |word|
    new_sentence << word if !negative?(word)
  end
  new_sentence.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
puts

problem("Password")

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

# if !password
#   password = set_password
# end

# verify_password(password)
puts

problem("Number Guessing Game")

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    if attempts > max_attempts
      puts "That's the maximum attempts! You lose, better luck next time."
      break
    end

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
  # Try again:
  puts "Would you like to try again? (Y/N)"
  play_again = gets.chomp
  guess_number(max_number, max_attempts) if play_again == "Y"
end

# guess_number(10, 3)
puts

problem("TF-IDF")

# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }.to_f
  return 0 if number_of_documents_with_term == 0
  Math.log(number_of_documents / number_of_documents_with_term)
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0
puts
puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0
puts
puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3
puts
puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4
puts

problem("What's wrong with the output")

arr = ["9", "8", "7", "10", "11"]
# binding.pry
new_arr = arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

p new_arr

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
