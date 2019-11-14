require 'pry'

VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
CHOICE_ABBREVIATIONS = ["r", "p", "sc", "l", "sp"]
WINNING_SCORE = 5

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
  winning_combinations = {
    rock: ['scissors', 'lizard'],
    paper: ['rock', 'spock'],
    scissors: ['paper', 'lizard'],
    lizard: ['paper', 'spock'],
    spock: ['rock', 'scissors']
  }

  winning_combinations[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def clear
  system('clear') || system('cls')
end

def play_again_valid_response?(response)
  valid_responses = ['y', 'yes', 'n', 'no']
  valid_responses.include?(response)
end

def play_again
  play_again = ''
  loop do
    prompt("Do you want to play again? Yes(y)/No(n)")
    play_again = gets.chomp.downcase

    if play_again_valid_response?(play_again)
      break
    else
      prompt("That's not a valid response.")
    end
  end
  play_again
end

def player_selection
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
  choice
end

def keeping_score(outcome)
  score = {
    player_wins: 0,
    comp_wins: 0,
    ties: 0
  }

  if outcome == "You won!"
    score[:player_wins] = 1
  elsif outcome == "Computer won!"
    score[:comp_wins] = 1
  else
    score[:ties] = 1
  end
  score
end

def game_over(score)
  if score[:player_wins] == WINNING_SCORE ||
    score[:comp_wins] == WINNING_SCORE
    prompt("Game Over!")
    prompt("Final Score: You #{score[:player_wins]}, Computer #{score[:comp_wins]}, Ties #{score[:ties]}")
    puts ''
    true
  else
    prompt("Score: You #{score[:player_wins]}, Computer #{score[:comp_wins]}, Ties #{score[:ties]}")
    puts ''
    prompt("On to the next round...")
    false
  end
end

# game play starts below

loop do
  scoreboard = {
    player_wins: 0,
    comp_wins: 0,
    ties: 0
  }

  clear
  prompt("Welcome to the enhanced version of Rock, Paper, Scissors")
  prompt("You'll be playing against the computer, first to 5 wins")

  loop do
    choice = player_selection
    computer_choice = VALID_CHOICES.sample
    clear

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    outcome = display_results(choice, computer_choice)
    prompt(outcome)

    score = keeping_score(outcome)
    scoreboard[score.key(1)] += 1

    break if game_over(scoreboard) == true
  end

  break unless play_again.start_with?('y')
end

clear
prompt("Thank you for playing. Good bye!")
