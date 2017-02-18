# Mortgage calculator

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def valid_rate?(rate)
  rate.to_f() != 0
end

prompt("Welcome to the Mortgage Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  amount = ''
  loop do
    prompt("What is your loan amount in dollars?")
    amount = Kernel.gets().chomp()

    if valid_number?(amount)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")

    end
  end

  years = ''
  loop do
    prompt("What is your loan term in years?")
    years = Kernel.gets().chomp()

    if valid_number?(years)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")

    end
  end

  apr = ''
  loop do
    prompt("What is your APR?")
    apr = Kernel.gets().chomp()

    if valid_rate?(apr)
      break
    else
      prompt("Hmm...that doesn't look like a valid rate.")

    end
  end

  rate = (apr.to_f / 12) / 100

  term = (years.to_i * 12)

  payment = amount.to_i * (rate / (1 - (1.0 + rate)**(-term)))

  prompt("Your monthly payment is approximately: $#{payment.to_i}")

  prompt("Do you want to perform another calculation? (Y to calculcate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator! Bye.")
