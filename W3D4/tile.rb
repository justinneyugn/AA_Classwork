require "colorize"

class Tile
  attr_reader :value

  def initialize(value=0)
    @value = value
    # @given = value == 0 ? false : true

    if value == 0
      @given = false
    else
      @given = true
    end
    
  end

  def color
    given? ? :blue : :red
  end

  def given?
    @given
  end

  def to_s
    value == 0 ? " " : value.to_s.colorize(color)
  end

  def value=(new_value)
    if given?
      puts "You can't change the value of a given tile."
    else
      @value = new_value
    end
  end
end
