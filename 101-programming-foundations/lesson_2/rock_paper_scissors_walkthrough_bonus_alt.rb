VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_SHORTHAND = %w(r p sc l sp)
VICTORY_TABLE = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  VICTORY_TABLE[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("You lost the round!")
  else
    prompt("It's a tie!")
  end
end

def win_counter(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'tie'
  end
end

def display_score(player_score, computer_score)
  prompt("You've won #{player_score} rounds, computer won #{computer_score}.")
end

player_score = 0
computer_score = 0

prompt("Welcome to Rock Paper Scissor Lizard Spock. First to 5 wins.")
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("(Select with #{VALID_CHOICES_SHORTHAND.join(', ')})")
    choice = gets.chomp.downcase

    if VALID_CHOICES_SHORTHAND.include?(choice)
      choice = VALID_CHOICES[VALID_CHOICES_SHORTHAND.index(choice)]
      break
    else
      prompt("Please enter a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose #{choice}, computer chose #{computer_choice}."

  display_results(choice, computer_choice)

  case win_counter(choice, computer_choice)
  when 'player' then player_score += 1
  when 'computer' then computer_score += 1
  end

  display_score(player_score, computer_score)

  if player_score == 5
    prompt("You won the game!")
  elsif computer_score == 5
    prompt("The computer defeated you.")
  end

  if player_score == 5 || computer_score == 5
    prompt "Do you want to play again?"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    player_score = 0
    computer_score = 0
  end
end

prompt "Thanks for playing!"
