require 'pry'
system 'clear'

def merge(array1, array2)
  result = []
  idx = 0

  array1.each do |num|
    while idx < array2.size && array2[idx] <= num
      result << array2[idx]
      idx += 1
    end
    result << num
  end
  result.concat(array2[idx..-1])

end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
