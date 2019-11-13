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

loop do
  player_wins = 0
  comp_wins = 0
  ties = 0
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

    outcome = display_results(choice, computer_choice)
    prompt(outcome)

    if outcome == "You won!"
      player_wins += 1
    elsif outcome == "Computer won!"
      comp_wins += 1
    else
      ties += 1
    end

    if player_wins == 5 || comp_wins == 5
      prompt("Game Over!")
      prompt("Final Score: You #{player_wins}, Computer #{comp_wins}, Ties #{ties}")
      break
    else
      prompt("Score: You #{player_wins}, Computer #{comp_wins}, Ties #{ties}")
      prompt("Next Round")
    end
  end

  prompt("Do you want to play again? (Y/N)")
  play_again = gets.chomp

  break unless play_again.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
