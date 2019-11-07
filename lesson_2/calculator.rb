# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num == num.to_i.to_s || num == num.to_f.to_s
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("#{MESSAGES['name']} #{name}!")

loop do
  number1 = 0
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = 0
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
  MSG
  # operator_prompt = MESSAGES['operator_prompt']

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES['operation_to_perform']}")

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("#{MESSAGES['result']} #{result}")

  prompt(MESSAGES['another_calculation'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
