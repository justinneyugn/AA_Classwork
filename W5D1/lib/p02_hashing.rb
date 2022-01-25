class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 10.hash if self.empty?
    (self[0] - self[-1]).hash
  end
end

class String
  def hash
    return 10.hash if self.empty?
    (self[0].to_i(2) - self[].to_i(2) + self.length).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?

    if (self.values)[0].is_a?(String)
      (self.values)[0].to_i(2) / (self.values)[-1].to_i(2)
    elsif (self.values)[0].is_a?(Integer)
      (self.values)[0].to_s(2)
    end
  end
end
