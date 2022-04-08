# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*num)
    largest_num = 0

    num.inject do |acc, el|
        if acc > el
            largest_num = acc
        else
            largest_num = el
        end
    end

    largest_num
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
