require "byebug"
class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
      counter = 0
      # debugger

      if accumulator == nil
        accumulator = self[0]
        (1...self.length).each do |i|
          counter = prc.call(accumulator, self[i])
          accumulator = counter
        end
      else
        (0...self.length).each do |i|
          counter = prc.call(accumulator, self[i])
          accumulator = counter
        end
      end

      accumulator
  end
end

# p [1, 2, 3].my_inject(1) { |acc, x| acc + x }

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2

  (2...num).each { |factor| return false if num % factor == 0 }

  true
end

def primes(num)
  return [] if num == 0
  arr = []
  test = 2
  while arr.length < num
    arr << test if is_prime?(test)
    test += 1
  end

  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2
  previous = factorials_rec(num-1)
  previous << (num - 1) * previous[-1]
end


class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hsh = Hash.new {|h,k| h[k] = []}

    self.each_with_index do |ele, i|
      hsh[ele] << i if self.count(ele) > 1
    end
    hsh
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    self_arr = self.split("")
    sub = []
    sym = []
    self_arr.each.with_index do |first, i|
      self_arr.each.with_index do |second, j|
        if j >= i
          sub << self_arr[i..j].join
        end
      end
    end
    sub.each do |ele|
      sym << ele if ele.length > 1 && ele == ele.reverse
    end
    sym
  end
end


class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    # debugger
    return self if self.length <= 1
    prc ||= Proc.new { |a, b| a <=> b }
    mid = self.length/2
    left = self[0...mid]
    right = self[mid..-1]
    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    merged = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right
  end
  
end



