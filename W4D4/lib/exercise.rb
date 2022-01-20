class Array

    def uniq
        unique = []
        self.each do |num|
            unique << num if !unique.include?(num)
        end
        unique
    end

end

