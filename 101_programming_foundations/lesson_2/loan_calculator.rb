# Loan Calculator


# need: 
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# From the above, you'll need to calculate the following two things:

# monthly interest rate: j
# loan duration in months

# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = principal
# j = monthly interest rate
# n = duration in months

# believe ultimate output is monthly payment

def prompt msg
  puts "==> #{msg}"
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def valid_number?(number)
  (float?(number) || integer?(number)) && (number.to_f > 0)
end

prompt 'Welcome to the Loan Payment Calculator'

loop do
  principal = 0
  loop do
    prompt 'How much are you looking to borrow? ($)'
    principal = gets.chomp
    break if valid_number?(principal)
    prompt 'Please make sure to enter a valid positive dollar amount'
  end

  apr = 0
  loop do
    prompt 'What\'s your APR % (e.g. 5 for 5%, 6.5 for 6.5%, etc.)'
    apr = gets.chomp
    break if valid_number?(apr)
    prompt 'Please make sure to enter a valid positive percentage rate'
  end

  months = 0
  loop do
    prompt 'How long is your loan in months?'
    months = gets.chomp
    break if valid_number?(months)
    prompt 'Please make sure to enter a valid positive number of months'
  end

  monthly_interest = apr.to_f / 100 / 12
  monthly_payment = principal.to_f * (monthly_interest / (1 - (1 + monthly_interest)**(-months.to_f)))

  prompt "Your monthly payment is... $#{format("%.2f", monthly_payment)}"

  prompt "Want to calculate another monthly payment? (Enter Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for calculating with us today. Stay beautiful.' 