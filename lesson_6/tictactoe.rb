BEGINS_GAME = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def clear
  system('clear')
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear
  puts "You're #{PLAYER_MARKER}, the computer is #{COMPUTER_MARKER}"
  puts ''
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ''
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def who_plays_first
  plays_first = ''
  loop do
    prompt("Who would you like to go first; Computer(c) or Player(p)?")
    plays_first = gets.chomp.downcase

    if play_first_valid_response?(plays_first)
      break
    else
      prompt("That's not a valid response")
    end
  end
  plays_first
end

def play_first_valid_response?(response)
  valid_responses = ['player', 'computer', 'p', 'c']
  valid_responses.include?(response)
end

def player_first?(response)
  response.start_with?('p')
end

def player_selects_position!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice")
  end
  brd[square] = PLAYER_MARKER
end

def joinor(arr, delimiter = ', ', join_word = 'or')
  case arr.count
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{join_word} ")
  else
    arr[-1] = "#{join_word} #{arr.last}"
    arr.join(delimiter)
  end
end

def computer_selects_postion!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(brd, line, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(brd, line, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    brd[5] == INITIAL_MARKER ? square = 5 : square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(brd, line, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      # splat converts array into separate arguments [1, 2, 3] => (1, 2, 3)
      return 'Player'
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return 'Computer'
    end
  end
  nil
end

def play_again
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
  play_again
end

def valid_response?(response)
  valid_responses = ['y', 'yes', 'n', 'no']
  valid_responses.include?(response)
end

def result_of_game(brd)
  if winner?(brd)
    prompt("#{detect_winner(brd)} won!")
  else
    prompt("It's a tie!")
  end
end

def keeping_score(brd, score)
  if detect_winner(brd) == 'Player'
    score[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    score[:computer] += 1
  else
    score[:ties] += 1
  end
end

def match_over?(score)
  if score[:player] == 5 || score[:computer] == 5
    puts ''
    prompt("#{score.key(5).capitalize} wins the match!!")
    true
  end
end

def next_game
  ready = ''
  loop do
    prompt("Enter (Y)es to begin the next game, or (N)o to exit match.")
    ready = gets.chomp.downcase

    if valid_response?(ready)
      break
    else
      prompt("That's not a valid response.")
    end
  end
  ready
end

def determine_first_move
  first_move = ''
  case BEGINS_GAME
  when 'computer'
    first_move = 'computer'
    game_start_message(first_move)
  when 'player'
    first_move = 'player'
    game_start_message(first_move)
  else
    first_move = who_plays_first
  end
  first_move
end

def game_start_message(first_play)
  prompt("The #{first_play} will make the first selection.")
  prompt("Press any key to continue")
  gets.chomp
end

def place_piece!(board, player)
  if player_first?(player)
    player_selects_position!(board)
  else
    computer_selects_postion!(board)
  end
end

def alternate_player(player)
  player_first?(player) ? 'computer' : 'player'
end

# Game loop starts below

loop do
  score = { player: 0, computer: 0, ties: 0 }
  clear
  prompt("Welcome to tic tac toe!")
  prompt("The first player to get 5 wins is the winner!!")
  puts ''
  current_player = determine_first_move

  loop do
    board = initialize_board
    display_board(board)

    loop do
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)

      break if winner?(board) || board_full?(board)

      display_board(board)
    end

    display_board(board)
    result_of_game(board)

    keeping_score(board, score)
    prompt("Player: #{score[:player]} " \
          "Computer: #{score[:computer]} " \
          "Ties: #{score[:ties]}")
    prompt("First to 5 wins...")

    break if match_over?(score)
    puts ''
    break unless next_game.start_with?('y')
    puts ''
  end
  puts ''
  break unless play_again.start_with?('y')
end

prompt("Thanks for playing. Good bye!")
