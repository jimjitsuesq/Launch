require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "      |     |     "
  puts "   #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "      |     |     "
  puts "------------------"
  puts "      |     |     "
  puts "   #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "      |     |     "
  puts "------------------"
  puts "      |     |     "
  puts "   #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "      |     |     "
  puts ""
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delim=", ", word="or")
  if arr.count == 2
    puts "1 or 2"
  elsif arr.count == 1
    puts arr.to_s
  else
    arr_last = arr.pop
    arr.push(word)
    puts "#{arr.join(delim)} #{arr_last}"
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_computer_opportunities(line, board)
  if board.values_at(*line).count('O') == 2
    board.select { |k, v| line.include?(k) && v == ' ' }.keys.first
    binding.pry
  end
end

def computer_places_piece!(brd)
  square = ''
  board = []
  WINNING_LINES.each do |line|
    find_computer_opportunities(line, board)
    if square == ''
      break
    elsif brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == INITIAL_MARKER
      square = line[2]
      break
    elsif brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER && brd[line[0]] == INITIAL_MARKER
      square = line[0]
      break
    elsif brd[line[0]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER && brd[line[1]] == INITIAL_MARKER
      square = line[1]
      break
    
    # COULD NOT GET THIS CASE STATEMENT TO WORK.  ALWAYS GOES TO 'ELSE'
    # case square
    # when brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == INITIAL_MARKER
    #  square = line[2]
    #  break
    # when brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER && brd[line[0]] == INITIAL_MARKER
    #  square = line[0]
    #  break
    # when brd[line[0]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER && brd[line[1]] == INITIAL_MARKER
    #  square = line[1]
    #  break
    else
      square = empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

computer_count = 0
player_count = 0

loop do
  loop do
    board = initialize_board
    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      display_board(board)
    end

    display_board(board)
    puts player_count
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == 'Player'
        player_count += 1
        puts "You have won #{player_count} times!"
        puts "The computer has won #{computer_count} times."
      elsif computer_count += 1
        puts "The computer has won #{computer_count} times!"
        puts "You have won #{player_count} times."
      end
    else
      prompt "It's a tie!"
    end

    if computer_count == 5 || player_count == 5
      puts "Game over."
      break
    else
      prompt "Press (y) for the next game in the series."
      gets.chomp
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!  Good bye!"
