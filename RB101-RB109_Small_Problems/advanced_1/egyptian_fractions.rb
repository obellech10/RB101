require 'pry'
system 'clear'

def egyptian(rational)
  value = 0
  denominators = []
  increment = 1
  loop do
    if value + Rational(1,increment) <= rational
      value += Rational(1,increment)
      denominators << increment
    end

    break if value == rational
    increment += 1
  end
  denominators
end

def unegyptian(array)
  # array.each_with_object([]) do |number, result|
  #   result << Rational(1,number)
  # end.sum
  array.inject(0) do |result, number|
      result += Rational(1,number)
  end
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(1, 2))
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
puts
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
