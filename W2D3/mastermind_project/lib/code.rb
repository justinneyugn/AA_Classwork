class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.each { |char| return false if !POSSIBLE_PEGS.has_key?(char.upcase) }

    true
  end

  def initialize(arr)
    raise if !Code.valid_pegs?(arr)

    @pegs = arr.map { |char| char.upcase}
  end

  def self.random(length)
    pegs = ["R", "G", "B", "Y"]
    new_arr = Array.new(length)
    i = 0
    length.times do 
      idx = rand(0...4)
      new_arr[i] = pegs[idx]
      i += 1
    end

    new_code = Code.new(new_arr)
  end

  def self.from_string(string)
    str_arr = string.split("")
    new_code = Code.new(str_arr)
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_inst)
    counter = 0
    i = 0

    @pegs.length.times do  
      counter += 1 if @pegs[i] == code_inst.pegs[i]
      i += 1
    end
    puts counter
  end

  def num_near_matches(code_inst)
    counter = 0

    (0...@pegs.length).each { |i| counter += 1 if @pegs.include?(code_inst.pegs[i]) && @pegs[i] != code_inst.pegs[i]}

    counter
  end

  def ==(code_inst_2)
    return true if self.pegs == code_inst_2.pegs

    false
  end

end
