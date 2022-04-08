def matrix_addition_reloaded(*mtrx)
    return mtrx if mtrx.length == 1

    idx = 0

    while idx < mtrx.length - 1
        return nil if mtrx[idx].length != mtrx[idx+1].length
        idx += 1
    end

    i = 0
    current_mtrx = mtrx[0]
    while i < mtrx.length - 1
        total_mtrx = matrix_addition(current_mtrx, mtrx[i+1])
        current_mtrx = total_mtrx
        i += 1
    end

    total_mtrx
end

def matrix_addition(mx1, mx2)
    total_mx = []
    temp = []

    mx1.each_with_index do |sub, i|
        sub.each_with_index do |ele, j|
            temp << ele + mx2[i][j]
        end
        total_mx << temp
        temp = []
    end

    total_mx
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
require "byebug"
def squarocol?(arr)
  
    match = false

    arr.each do |sub|
        i = 0
        match = true
        while i < sub.length - 1
            match = false if sub[i] != sub[i + 1]
            i += 1
        end
    end
    return true if match

    debugger
    arr.each_with_index do |sub, idx1|
        j = 0
        match = true
        while j < sub.length - 2
            match = false if arr[j][idx1] != arr[j+1][idx1]
            j += 1
        end
    end

    true
    
end


p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

   # arr.each_with_index do |sub1, i1|
    #     arr.each_with_index do |sub2, i2|
    #         x = i2
    #         if arr[i1][x] == arr[i1][i2]
    #     end
    # end

    # arr.each_with_index do |ele1, idx1|
    #     arr.each_with_index do |ele2, idx2|
    #         if 
    #     end
    # end