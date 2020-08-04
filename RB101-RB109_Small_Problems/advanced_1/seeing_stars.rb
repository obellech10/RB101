require 'pry'
system 'clear'

def star(size)
  rows = []
  rows.push('*' * size)
  rotations = (size-1) / 2
  rotations.times do |spaces|
    line = ('*' + (' ' * spaces) + '*' + (' ' * spaces) + '*').center(size)
    rows.push(line)
    rows.unshift(line)
  end
  rows.each {|line| puts line}
end

=begin
  method that displays an 8 sided star, that takes an integer as argument (n).
  the size of the star is determined by the argument and will be (n x n)
  argument will be and odd number and the smallest star will be 7x7 grid

  the middle row of the grid will contain all stars and be the length of the
  argument.

  each row before or after middle row will contain a space between stars, the
  amount of spaces between stars will increase as you move away from the middle
  and will only ever contain three stars

  Data Structure?
  array to hold each line, iterating and displaying each line once array has
  been filled.

  Algorithm
  1. create middle row by multplying '*' by the argument 'n'
  2. create the next row from the middle by combining 3 '*' with no spaces, than
  increasing the space by between stars using a counter to increase the number
  of spaces.
  3. push & unshift the newly created rows the the array.
  4. iterate through array outputting each row.

=end

star(7)
puts
star(9)
