require 'pry'

VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
CHOICE_ABBREVIATIONS = ["r", "p", "sc", "l", "sp"]

def prompt(message)
  puts "=> #{message}"
end

def transform_abbreviation(selection)
  choice_hash = {
    r: 'rock',
    p: 'paper',
    sc: 'scissors',
    l: 'lizard',
    sp: 'spock'
  }
  choice_hash[selection.to_sym]
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    elsif CHOICE_ABBREVIATIONS.include?(choice)
      choice = transform_abbreviation(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again? (Y/N)")
  play_again = gets.chomp

  break unless play_again.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
