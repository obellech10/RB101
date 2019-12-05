require 'pry'

system('clear')

CARD_VALUES = {
  h2: 2, h3: 3, h4: 4, h5: 5, h6: 6, h7: 7, h8: 8, h9: 9, h10: 10, hj: 10, hq: 10, hk: 10, ha: 11,
  c2: 2, c3: 3, c4: 4, c5: 5, c6: 6, c7: 7, c8: 8, c9: 9, c10: 10, cj: 10, cq: 10, ck: 10, ca: 11,
  d2: 2, d3: 3, d4: 4, d5: 5, d6: 6, d7: 7, d8: 8, d9: 9, d10: 10, dj: 10, dq: 10, dk: 10, da: 11,
  s2: 2, s3: 3, s4: 4, s5: 5, s6: 6, s7: 7, s8: 8, s9: 9, s10: 10, sj: 10, sq: 10, sk: 10, sa: 11
}

# deck = [
#   'h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'h8', 'h9', 'h10', 'hj', 'hq', 'hk', 'ha',
#   'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9', 'c10', 'cj', 'cq', 'ck', 'ca',
#   'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'd8', 'd9', 'd10', 'dj', 'dq', 'dk', 'da',
#   's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 'sj', 'sq', 'sk', 'sa'
# ]

def prompt(message)
  puts "=> #{message}"
end

def clear
  system('clear')
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

def initialize_deck
  CARD_VALUES.keys.map {|card| card.to_s}.shuffle!
end

# Deal cards
def deal_cards(deck, amount)
  deck.shift(amount)
end

# start of game
deck = initialize_deck

# Game loop
loop do
  clear
  outcome = ''

  if deck.count < 10
    deck = initialize_deck
    prompt("Reshuffling the deck...")
  end

  player_hand = deal_cards(deck, 2)
  dealer_hand = deal_cards(deck, 2)

  # player hand loop
  loop do
    prompt("You have the following cards #{player_hand}")
    prompt("for a total of #{total(player_hand)}")
    puts ''
    prompt("The dealer is showing #{dealer_hand[0]}")
    puts ''
    prompt("Would you like to hit or stay?")
    action = gets.chomp.downcase

    if action == 'hit'
      player_hand += deal_cards(deck, 1)

      if total(player_hand) > 21
        prompt("You busted!")
        prompt("Hand: #{player_hand} Total: #{total(player_hand)}")
        puts ''
        outcome = 'dealer'
        break
      end

      clear
    elsif action == 'stay'
      break
    end
  end

  # dealer loop
  if outcome == ''
    loop do
      prompt("The dealers hand is: #{dealer_hand} Total: #{total(dealer_hand)}")
      if total(dealer_hand) > 21
        prompt("The dealer busted. You win!")
        puts ''
        outcome = 'player'
        break
      elsif total(dealer_hand) >= 17
        prompt("The dealer stays")
        break
      else
        dealer_hand += deal_cards(deck, 1)
        prompt("The dealer will hit")
        puts ''
      end
    end
  end

  #compare hands to determine winner
  if outcome == ''
    outcome = winner(dealer_hand, player_hand)
    prompt("The result is, #{outcome}!")
  end

  break unless play_again?
end
