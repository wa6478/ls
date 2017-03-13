require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'es'

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def valid_number?(number)
  float?(number) || integer?(number)
end

def operation_to_message(op)
  result = case op
           when '1'
             messages('adding')
           when '2'
             messages('subtracting')
           when '3'
             messages('multiplying')
           when '4'
             messages('dividing')
           end
  result
end

prompt(messages('welcome'))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('invalid_name'))
  else
    break
  end
end

prompt(messages('name') + "#{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_num'))
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(messages('invalid_num'))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_num'))
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(messages('invalid_num'))
    end
  end

  prompt(messages('operator'))

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('choose'))
    end
  end

  prompt("#{operation_to_message(operator)}" + messages('calculating'))

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(messages('result') + "#{result}")

  prompt(messages('another'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('bye'))
