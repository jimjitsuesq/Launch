require 'pry'

DECK =  [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H','A']] +
        [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D','A']] +
        [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C','A']] +
        [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S','A']]

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = DECK
end

def draw_cards
  DECK.delete_at(rand(DECK.length))
end

def display_hands(arr1, arr2)
  if arr1.count == 1
    prompt "The Dealer's cards are: #{arr1[0][1]} and an unknown card"
    prompt "Your cards are:         #{arr2[0][1]} #{arr2[1][1]}"
  else
    prompt "The Dealer's cards are: #{arr1[0..10][1]}"
    prompt "Your cards are:         #{arr2[0..10][1]}"
  end
end

def player_hit
  player_hand << draw_cards
end

def dealer_hit
  dealer_hand << draw_cards
end

def player_turn
  loop do
  puts "hit or stay?"
    answer = gets.chomp.downcase
  break if answer == 'stay' || busted?   # the busted? method is not shown
  player_hit
  binding.pry
  display_hands
  end
end

def busted?

end

def dealer_turn

end

def determine_winner

end

def display_results

end

dealer_hand = []
player_hand = []
answer = nil

loop do
  initialize_deck
  dealer_hand = draw_cards
  binding.pry
  player_hand = draw_cards, draw_cards
  binding.pry
    display_hands(dealer_hand, player_hand)
    binding.pry
    player_turn
    
  
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing 21!  Good bye!"
