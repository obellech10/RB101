require 'pry'

system('clear')

CARD_VALUES = {
  h2: 2, h3: 3, h4: 4, h5: 5, h6: 6, h7: 7, h8: 8, h9: 9, h10: 10, hj: 10,
  hq: 10, hk: 10, ha: 11, c2: 2, c3: 3, c4: 4, c5: 5, c6: 6, c7: 7, c8: 8,
  c9: 9, c10: 10, cj: 10, cq: 10, ck: 10, ca: 11, d2: 2, d3: 3, d4: 4, d5: 5,
  d6: 6, d7: 7, d8: 8, d9: 9, d10: 10, dj: 10, dq: 10, dk: 10, da: 11, s2: 2,
  s3: 3, s4: 4, s5: 5, s6: 6, s7: 7, s8: 8, s9: 9, s10: 10, sj: 10, sq: 10,
  sk: 10, sa: 11
}

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
  prompt("Let's begin...")
  puts ''
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

  if total > 21 && aces > 0
    aces.times do
      total -= 10 if total > 21
    end
  end
  total
end

def winner(dealer, player)
  if total(dealer) == total(player)
    'a push'
  else
    total(dealer) > total(player) ? 'dealer wins' : 'player wins'
  end
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
  if total(hand) > 21
    prompt("You busted!")
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
    if decision == 'player'
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
  if total(dealer_hand) > 21
    prompt("The dealer busted. You win!\n ")
    outcome = 'player'
  elsif total(dealer_hand) >= 17
    prompt("The dealer stays")
    outcome = 'stay'
  else
    dealer_hand << deck.shift
    prompt("The dealer will hit\n ")
  end
  outcome
end

# start of game
deck = initialize_deck

# Game loop
loop do
  clear
  game_intro
  _outcome = nil

  if deck.count < 10
    deck = initialize_deck
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
    outcome = winner(dealer_hand, player_hand)
    prompt("The result is, #{outcome}!\n ")
  end

  break unless play_again?
end
