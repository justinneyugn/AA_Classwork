require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_inst)
        counter = 0
        count = 0

        # (0...@secret_code.length).each { |i| counter += 1 if @secret_code.pegs[i] == code_inst.pegs[i] }
        # puts counter

        # (0...@secret_code.length).each do |j|
        #     count += 1 if @secret_code.pegs.include?(code_inst.pegs[i]) && @secret_code.pegs[i] != code_inst.pegs[i]
        # end

        # puts count
    end

    def ask_user_for_guess
        puts "Enter a code"

        code = gets.chomp
        new_code = Code.from_string(code)
        # self.print_matches(new_code)
        if new_code == @secret_code
            return true
        else
            return false
        end
    end
end
