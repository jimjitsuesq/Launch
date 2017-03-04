require 'pry'

DECK =  [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H','A']] +
        [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D','A']] +
        [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C','A']] +
        [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S','A']]
PLAYER_HAND = []
DEALER_HAND = []

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = DECK
end

def draw_cards
  DECK.delete_at(rand(DECK.length))
end

def display_initial_hands(arr1, arr2)
    prompt "The Dealer's cards are:   #{arr1[0][1]} and an unknown card"
      arr1.map! { |card| card[1] }
      @display_arr1 = arr1.dup
      arr2.map! { |card| card[1] }
      @display_arr2 = arr2.dup
      prompt "Your cards are:         #{arr2.join(" ")}"
      arr2
end

def display_player_hands(arr1, arr2)
    prompt "The Dealer's cards are: #{arr1[0]} and an unknown card"
    arr2[-1] = arr2[-1][1]
    @display_arr2 << arr2[-1]
    prompt "Your cards are:         #{@display_arr2.join(" ")}"
end

def display_dealer_hands(arr1, arr2)
  system "clear"
  arr1[-1] = arr1[-1][1]
  @display_arr1 << arr1[-1]
  prompt "The Dealer's cards are: #{@display_arr1.join(" ")}"
  prompt "Your cards are:         #{@display_arr2.join(" ")}"
end

def player_hit
  PLAYER_HAND << draw_cards
end

def dealer_hit
  DEALER_HAND << draw_cards
end

def process_cards_to_i(arr1, arr2)
  arr1.each_with_index do |num, index|
    if num == 'J' || num == 'Q' || num == 'K'
      num2 = 10
    elsif num == 'A'
      num2 = 0
    else
      num2 = num.to_i
    end
      arr1.delete_at(index)
      arr1.unshift(num2)
  end
  arr2.each_with_index do |num, index|
    if num == 'J' || num == 'Q' || num == 'K'
      num2 = 10
    elsif num == 'A'
      num2 = 0
    else
      num2 = num.to_i
    end
      arr2.delete_at(index)
      arr2.unshift(num2)
  end
end

def determine_player_score(arr1, arr2)
  ace_count2 = arr2.count(0)
  @player_score = arr2.inject { |sum, num| sum + num }
  
    if ace_count2 == 1 then
      if (@player_score + 11) <= 21
        @player_score = (@player_score + 11 )       
      else @player_score = (@player_score + 1)
      end
    elsif ace_count2 == 2 then
      if (@player_score + 12) <= 21
        @player_score = (@player_score + 12 )       
      else @player_score = (@player_score + 2)
      end
    elsif ace_count2 == 3 then
      if (@player_score + 13) <= 21
        @player_score = (@player_score + 13 )       
      else @player_score = (@player_score + 3)
      end
    elsif ace_count2 == 4 then
      if (@player_score + 14) <= 21
        @player_score = (@player_score + 14 )       
      else @player_score = (@player_score + 4)
      end
    else
      @player_score = @player_score
    end
end

def determine_dealer_score(arr1, arr2)
  ace_count1 = arr1.count(0)
  @dealer_score = arr1.inject { |sum, num| sum + num }
    if ace_count1 == 1 then
      if (@dealer_score + 11) <= 21
        @dealer_score = (@dealer_score + 11)        
      else @dealer_score = @dealer_score + 1
      end
    elsif ace_count1 == 2 then
      if (@dealer_score + 12) <= 21 && (@dealer_score + 12) >= 17
        @dealer_score = @dealer_score + 12
      else
        @dealer_score = @dealer_score + 2
      end
    elsif ace_count1 == 3 then
      if (@dealer_score + 13) <= 21 && (@dealer_score + 13) >= 17
        @dealer_score = @dealer_score + 13
      else
        @dealer_score = @dealer_score + 3
      end
    elsif ace_count1 == 4 then
      if (@dealer_score + 14) <= 21 && (@dealer_score + 14) >= 17
        @dealer_score = @dealer_score + 14
      else
        @dealer_score = @dealer_score + 4
      end
    else
      @dealer_score = @dealer_score
    end
end

def player_turn
  loop do
    puts "hit or stay?"
    answer = gets.chomp.downcase
    break if answer == 'stay'
    player_hit                                        # <--------no loop
    system "clear"
    display_player_hands(DEALER_HAND, PLAYER_HAND)    # <--------no loop
    process_cards_to_i(DEALER_HAND, PLAYER_HAND)      # <--------no loop
    determine_player_score(DEALER_HAND, PLAYER_HAND)  # <--------no loop
    break if busted?
  end
  return
end

def busted?
  @player_score > 21
end

def dealer_turn
  loop do
  dealer_hit
  display_dealer_hands(DEALER_HAND, PLAYER_HAND)
  process_cards_to_i(DEALER_HAND, PLAYER_HAND)
  determine_player_score(DEALER_HAND, PLAYER_HAND)
  determine_dealer_score(DEALER_HAND, PLAYER_HAND)
  break if @dealer_score >= 17
  prompt "Press 'Enter' for dealer's next card"
  answer = gets.chomp
  end
  return
end

def determine_winner
  if @dealer_score == @player_score
    @winner = "You tied with the dealer!"
  elsif @dealer_score > 21
    @winner = "The dealer busted so you won!"
  elsif @dealer_score > @player_score
    @winner = "Sorry. You lost!"
  else
    @winner = "You won!"
  end
end

def display_results
  prompt @winner
end

@dealer_score = 0
@player_score = 0
@winner = ''
@display_arr1
@display_arr2
answer = nil

loop do
  DEALER_HAND = []
  PLAYER_HAND = []
  @display_arr1 = []
  @display_arr2 = []
  loop do
    winner = ''
    initialize_deck
    system 'clear'
    DEALER_HAND = [draw_cards]
    PLAYER_HAND = draw_cards, draw_cards
    display_initial_hands(DEALER_HAND, PLAYER_HAND) # <-----no loop, just an iteration
    player_turn                                     # <-----loop, breaks if busted
    break if busted?
    system 'clear'
    dealer_turn
    determine_winner
    display_results
    break
  end
  
  if busted?
  prompt "Sorry. You busted!"
  end
  binding.pry
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  
end

prompt "Thanks for playing 21!  Good bye!"
