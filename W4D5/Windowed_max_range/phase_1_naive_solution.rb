# O(n)
def windowed_max_range(array, window_size)
  current_max_range = nil
  (0..array.length-window_size).each do |i|
    wind = array[i..i+window_size-1]
    wind_range = wind.max - wind.min
    current_max_range = wind_range if (current_max_range.nil?) || (wind_range > current_max_range)
  end
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #==> 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #==> 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #==> 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #==> 6 # 3, 2, 5, 4, 8