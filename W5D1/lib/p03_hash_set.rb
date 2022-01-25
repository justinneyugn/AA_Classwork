class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end
    i = key.hash % num_buckets
    @store[i] << key
    @count += 1
  end

  def include?(key)
    i = key.hash % num_buckets
    return true if @store[i].include?(key)
    false
  end

  def remove(key)
    i = key.hash % num_buckets
    if self.include?(key)
      @store[i].delete(key) 
      @count -= 1
    end
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
