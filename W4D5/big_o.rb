require "byebug"

# This is O(n**2)
def my_min1(array)
  array.each_with_index do |num1, i|
    counter = 0
    array.each_with_index do |num2, j|
      counter += 1 if num1 < num2
    end
    return num1 if counter == array.length - 1
  end
end

# This is O(n)
def my_min2(array)
  minimum = array.first
  array.each do |num|
    minimum = num if num < minimum
  end
  minimum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)

def largest_contiguous_subsum1(list)
  sublist = []
  list.each_with_index do |num1, i|
    list.each_with_index do |num2, j|
      sublist << list[i..j] if i <= j
    end
  end
  big_array = sublist.inject do |big_sum, sub|
    if big_sum.sum > sub.sum
      big_sum
    else
      sub
    end
  end
  big_array.sum
end

def largest_contiguous_subsum2(list)
  return list.max if list.max < 0

  curr_max = max_so_far = 0
  list.each do |num|
    curr_max += num
    curr_max = 0 if curr_max < 0
    max_so_far = curr_max if curr_max > max_so_far
  end
  max_so_far
end


# list = [-5, -1, -3]
# p largest_contiguous_subsum2(list) # => -1

# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list2) # => 8 (from [7, -6, 7])

# list3 = [5, 3, -7]
# p largest_contiguous_subsum2(list3) # => 8

# list4 = [1, 2, -4, 4, -1, 3]
# p largest_contiguous_subsum2(list4) # => 6

# list5 = [5, 3, 7]
# p largest_contiguous_subsum2(list5) # => 15