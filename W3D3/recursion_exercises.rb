require "byebug"

def iterative_range(min, max)
  arr = []
  (min...max).each { |num| arr << num }
  arr
end

# p "iteravtive_range"
# p iterative_range(1, 5)

def recursive_range(min, max)
  return [] if min == max
  arr = [min]
  arr += recursive_range(min + 1, max)
end

# p "recursive_range"
# p recursive_range(1, 5)

def exponent_1(b, num)
  raise "this example is only for positive exponents" if num < 0
  return 1 if num == 0
  b * exponent_1(b, num - 1)
end

# p "Recursion 1:"
# p exponent_1(1, 0)
# p exponent_1(2, 3) #8
# p exponent_1(2, 8) 
# p exponent_1(3, 9)

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exponent_2(b, num)
    return 1 if num == 0
    return b if num == 1
    if num.even?
      exponent_2(b, num/2) ** 2
    else
      b * (exponent_2(b, (num-1)/2) ** 2)
    end
end

# p "Recursion 2: "
# p exponent_2(1, 0) #1
# p exponent_2(3, 2) #9
# p exponent_2(2, 3) #8
# p exponent_2(2, 4) #16
# p exponent_2(2, 8) #256
# p exponent_2(3, 9) #19683

# # recursion 2
# p exp(b, 0) = 1
# p exp(b, 1) = b
# p exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# p exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]


def deep_dupe(array)
  return [array] if !array[0].is_a?(Array)
  return array if array.length == 0 
  [array] + deep_dupe(array[1..-1])
end

# array = [1, [2], [3, [4]]]
# [1] += deep_dupe[[2], [3, [4]]
#         n_array = [[2], [3, [4]]

# p deep_dupe(1)
# p deep_dupe([])
# p deep_dupe([1, [2], [3, [4]]])

def rec_fib(n)
    return [0] if n == 0
    return [0, 1] if n == 1
    return [0, 1, 1] if n == 2
    fib = rec_fib(n - 1)
    fib << fib[-1] + fib[-2]
end

def iter_fib(n)
    fib = [0, 1, 1]
    return [0] if n == 0
    return [0, 1] if n == 1
    return [0, 1, 1] if n == 2
    i = n
    while i > 2
        fib << fib[-1] + fib[-2]
        i -= 1
    end
    fib
end

# p iter_fib(0)
# p iter_fib(1)
# p iter_fib(2)
# p iter_fib(3)
# p iter_fib(8)

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

def bsearch(array, target)
  return nil if array.length == 0
  # debugger
  mid_idx = array.length / 2
  lal = array[0...mid_idx].length

  if array[mid_idx] == target
    return mid_idx
  elsif array[mid_idx] > target
    bsearch(array[0...mid_idx], target)
  elsif array[mid_idx] < target
    check_value = bsearch(array[mid_idx+1..-1], target)
    return nil if check_value == nil
    lal + check_value + 1
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# p bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 15) # => 14
# #           6

def merge_halves(farray, sarray)
  sorted_array = []

  while !farray.empty? && !sarray.empty?
    if farray.first > sarray.first
      sorted_array.push(sarray.shift)
    elsif farray.first < sarray.first
      sorted_array.push(farray.shift)
    end
  end
  if farray.empty?
    sorted_array += sarray
  elsif sarray.empty?
    sorted_array += farray
  end
  sorted_array
end

def merge_sort(array)
  # debugger
  return array if !array.is_a?(Array)
  return array if array.length == 1
  mid_idx = array.length / 2
  farray = array[0...mid_idx]
  sarray = array[mid_idx..-1]
  # farr = merge_sort(farray)
  # sarr = merge_sort(sarray)
  # farr += merge_sort(farray)
  # sarr += merge_sort(sarray)
  merge_halves(merge_sort(farray), merge_sort(sarray))
end

# p merge_sort(1)
# p merge_sort([1])
# p merge_sort([43, 3, 9, 82, 10])
# p merge_sort([38, 27, 43, 3, 9, 82, 10])


def subsets(array)
  return [] if array.empty?
  return [1] if array.length == 1
  return [[], [1], [2], [1, 2]] if array.length == 2
  new_arr = []
  new_arr << [array[-1]]
  (0...array.length - 1).each do |i|
    # debugger
    new_arr.push([array[i], array[-1]])
  end
  new_arr << array
  # new_arr.unshift(subsets(array[0...-1]))
  subsets(array[0...-1]) + new_arr
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
p subsets([1, 2, 3, 4]) # => [[], [1], [2], [1, 2],*** [3], [1, 3], [2, 3], [1, 2, 3] *** [4], [1, 4], [2, 4], [3, 4], [1, 2, 3, 4] *** [5], ]
# subsets([1, 2, 3, 4, 5])

# new_arr << array[-1]
# while each
#   everything from 0 to 2nd to last integer or el we're coupling with the array[-1]
# end
# new_arr << array[0..-1]
# 1 , 2, 3, 4
# []
# [] + 1
#     [] + 2
#     [1, 2]  + 3
#         [3]
#       [1, 3]
#           [2, 3]
#               [1, 2, 3] + 4
#                   [4]
#                       [1, 4]
#                           [2, 4]
#                               3, 4
#                                   [1, 2, 3, 4, 5]  
#                                   (0..-2).each do |i|
#                                     new_arr << [i, array[-1]]
#                                   end
# new_arr << array[0..-1]
# subset(array[0..-1]) += array


def permutations(array)

end

def iter_permutations(array)
  
end

# 1, 2, 3. each do |num|
#   new_arr = arr
#   new_arr delete num
  
#   1 [2, 3]
#   +1 + [2, 3]
#   [2, 3].rotate!
#   +p1 + [3, 2]

#   +2 + [1, 3]
#   [1, 3].rotate!
#   +2 + [3, 1]

#   +3 + [1, 2]
#   [1, 2].rotate!
#   +3 + [2, 1]
# end

# [1,2,3] [1,3,2] [2,1,3] [2,3,1] [3,1,2] [3,2,1]

# [1,2] [2,1]

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]

# ([1, 2, 3, 4]) [1, 2, 3, 4], [1, 2, 4, 3] [3, 1, 2, 4]

# [1]