class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num] == true
    false
  end

  private

  def is_valid?(num)
    return false if num < 0 || num >= @max
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    return true if @store[i].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= num_buckets
      p "inside if statement"
      resize!
    end
    i = num % num_buckets
    if !@store[i].include?(num)
      @store[i] << num 
      @count += 1
    end
  end

  def remove(num)
    i = num % num_buckets
    if @store[i].include?(num)
      @store[i].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    i = num % num_buckets
    return true if @store[i].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    arr.each { |num| insert(num) } 
  end
end
