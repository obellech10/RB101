require 'pry'

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  fruits = {}
  counter = 0

  loop do
    break if counter == produce_list.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      fruits[current_key] ||= current_value
    end
    counter += 1
  end

  fruits
end

puts select_fruit(produce)
puts produce

# Example of doubling numbers at odd indicies

def double_odd_indicies(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indicies(my_numbers)

# Example of taking an array and multiplying by the given argument

def multiply(numbers, factor)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] *= factor
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)
