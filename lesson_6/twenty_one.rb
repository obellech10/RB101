CARD_VALUES = {
  H2: 2, H3: 3, H4: 4, H5: 5, H6: 6, H7: 7, H8: 8, H9: 9, H10: 10, HJ: 10,
  HQ: 10, HK: 10, HA: 11, C2: 2, C3: 3, C4: 4, C5: 5, C6: 6, C7: 7, C8: 8,
  C9: 9, C10: 10, CJ: 10, CQ: 10, CK: 10, CA: 11, D2: 2, D3: 3, D4: 4, D5: 5,
  D6: 6, D7: 7, D8: 8, D9: 9, D10: 10, DJ: 10, DQ: 10, DK: 10, DA: 11, S2: 2,
  S3: 3, S4: 4, S5: 5, S6: 6, S7: 7, S8: 8, S9: 9, S10: 10, SJ: 10, SQ: 10,
  SK: 10, SA: 11
}

MAX_WIN_TOTAL = 21
DEALER_STAY_TOTAL = 17

def prompt(message)
  puts "=> #{message}"
end

def clear
  system('clear')
end

def game_intro
  prompt("Welcome to the game of Twenty-One.")
  prompt("The goal is to get as close to 21 as possible, without going over.")
  prompt("If you go over 21, it's a 'bust' and you lose.")
  prompt("First to 5 wins. Let's begin...\n ")
end

def total(hand)
  total = 0
  aces = 0
  hand.each do |card|
    if CARD_VALUES[card.to_sym] == 11
      aces += 1
    end

    total += CARD_VALUES[card.to_sym]
  end

  if total > MAX_WIN_TOTAL && aces > 0
    aces.times do
      total -= 10 if total > MAX_WIN_TOTAL
    end
  end
  total
end

def compare_hands(dealer, player)
  if total(dealer) == total(player)
    'a push'
  else
    total(dealer) > total(player) ? 'dealer wins' : 'player wins'
  end
end

def declare_winner(outcome)
  prompt("The result is, #{outcome}!\n ")
end

def play_again?
  play_again = ''
  loop do
    prompt("Do you want to play again? Yes(y)/No(n)")
    play_again = gets.chomp.downcase

    if valid_response?(play_again)
      break
    else
      prompt("That's not a valid response.")
    end
  end
  play_again.start_with?('y')
end

def valid_response?(response)
  valid_responses = ['y', 'yes', 'n', 'no']
  valid_responses.include?(response)
end

def valid_player_decision?(response)
  valid_responses = ['h', 'hit', 's', 'stay']
  valid_responses.include?(response)
end

def initialize_deck
  # CARD_VALUES.keys.map { |card| card.to_s }.shuffle!
  # Can pass transformation function as argument instead of block like above
  CARD_VALUES.keys.map(&:to_s).shuffle!
end

def deal_cards(deck, amount)
  deck.shift(amount)
end

def reshuffle
  initialize_deck
end

def player_turn(player_hand, dealer_hand, deck)
  outcome = nil
  loop do
    action = player_decision(player_hand, dealer_hand)

    player_hit(player_hand, deck) if action.start_with?('h')

    if player_busted?(player_hand)
      outcome = 'dealer wins'
      break
    end

    break if action.start_with?('s')
  end
  outcome
end

def player_decision(player_hand, dealer_hand)
  prompt("You have the following cards #{player_hand}")
  prompt("for a total of #{total(player_hand)}\n ")
  prompt("The dealer is showing #{dealer_hand[0]}\n ")
  answer = ''
  loop do
    prompt("Would you like to hit or stay?")
    answer = gets.chomp.downcase
    if valid_player_decision?(answer)
      break
    else
      prompt("That's not a valid response.")
    end
  end
  answer
end

def player_hit(hand, deck)
  hand << deal_cards(deck, 1).first
  clear
  game_intro
end

def player_busted?(hand)
  if total(hand) > MAX_WIN_TOTAL
    prompt("You busted.")
    prompt("Hand: #{hand} Total: #{total(hand)}\n ")
    true
  else
    false
  end
end

def dealer_turn(dealer_hand, deck)
  outcome = nil
  loop do
    decision = dealer_decision(dealer_hand, deck)
    if decision == 'player wins'
      outcome = decision
      break
    elsif decision == 'stay'
      break
    end
  end
  outcome
end

def dealer_decision(dealer_hand, deck)
  outcome = nil
  prompt("The dealers hand is: #{dealer_hand} Total: #{total(dealer_hand)}")
  if total(dealer_hand) > MAX_WIN_TOTAL
    prompt("The dealer busted.\n ")
    outcome = 'player wins'
  elsif total(dealer_hand) >= DEALER_STAY_TOTAL
    prompt("The dealer stays.\n ")
    outcome = 'stay'
  else
    dealer_hand << deck.shift
    prompt("The dealer will hit.\n ")
  end
  outcome
end

def keeping_score(result, score)
  case result
  when 'dealer wins' then score[:dealer] += 1
  when 'player wins' then score[:player] += 1
  else score[:push] += 1
  end
end

def return_score(score)
  prompt("The score is, " \
        "Player: #{score[:player]} " \
        "Dealer: #{score[:dealer]} " \
        "Push: #{score[:push]}\n ")
end

def match_over?(score)
  if score[:player] == 5 || score[:dealer] == 5
    prompt("#{score.key(5).capitalize} wins the match!!\n ")
    true
  end
end

def deal_next_hand
  prompt("Press any key to continue...")
  gets.chomp
  clear
  game_intro
end

# start of game
deck = initialize_deck

# Game loop
loop do
  clear
  game_intro
  score = { player: 0, dealer: 0, push: 0 }
  _outcome = nil

  loop do
    if deck.count < 10
      deck = reshuffle
      prompt("Reshuffling the deck...")
    end

    player_hand = deal_cards(deck, 2)
    dealer_hand = deal_cards(deck, 2)

    # player loop
    outcome = player_turn(player_hand, dealer_hand, deck)

    # dealer loop
    if outcome.nil?
      outcome = dealer_turn(dealer_hand, deck)
    end

    # compare hands to determine winner
    if outcome.nil?
      outcome = compare_hands(dealer_hand, player_hand)
    end

    declare_winner(outcome)

    keeping_score(outcome, score)
    return_score(score)
    break if match_over?(score)
    deal_next_hand
  end

  break unless play_again?
end

prompt("Thanks for playing 21. Good bye!")
