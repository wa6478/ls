# Walk-through: Rock Paper Scissors

# the user makes a choice
# the computer makes a choice
# the winner is displayed

# want to do my own attempt first before watching the video

def prompt(msg)
  puts "==> #{msg}"
end

choices = ['Rock', 'Paper', 'Scissors']

prompt "Rock, Paper, Scissors -- get ready..."
loop do
  prompt <<-MSG

    Choose:
    [1] Rock
    [2] Paper
    [3] Scissors
  MSG
  player_choice = gets.chomp.to_i - 1
  prompt "You chose #{choices[player_choice]}"

  computer_choice = rand(0..2)
  prompt "Computer chooses... #{choices[computer_choice]}."

  if choices[player_choice - 1] == choices[computer_choice]
    outcome = "Your #{choices[player_choice]} beats the Computer's #{choices[computer_choice]}!"
  elsif choices[player_choice] == choices[computer_choice]
    outcome = "Draw! You both chose #{choices[player_choice]}."
  else
    outcome = "Your #{choices[player_choice]} loses to the Computer's #{choices[computer_choice]}!"
  end

  prompt(outcome)

  prompt "Y to exit"
  break if gets.chomp.downcase.start_with?('y')
end
