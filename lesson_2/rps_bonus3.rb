VALID_CHOICES = %w(r p sc l sp)

abbreviation_hash = { r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'p' && second == 'r') ||
    (first == 'sc' && second == 'p') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'sc' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sp' && second == 'r')
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
  score = 0
  computer_score = 0
  loop do
    loop do
      prompt("Choose one: (r)ock, (p)aper, (sc)issors, (l)izard, or (sp)ock")
      choice = gets.chomp
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
    computer_choice = VALID_CHOICES.sample

    choice_def = abbreviation_hash[choice.to_sym]

    computer_choice_def = abbreviation_hash[computer_choice.to_sym]

    prompt("You chose: #{choice_def}; computer chose: #{computer_choice_def}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice) == true
      prompt("Your score is: #{score += 1}")
      prompt("The computer's score is: #{computer_score}")
    elsif win?(computer_choice, choice) == true
      prompt("Your score is: #{score}")
      prompt("The computer's score is: #{computer_score += 1}")
    else
      prompt("Your score is: #{score}")
      prompt("The computer's score is: #{computer_score}")
    end
    if score > 4
      prompt("You won the game!")
      break
    elsif computer_score > 4
      prompt("You lost the game!")
      break
    end
  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
