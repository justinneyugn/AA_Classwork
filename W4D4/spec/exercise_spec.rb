require "exercise"
require "rspec"

describe Array do
    describe "#uniq" do 
        it "removes duplicates from an array" do
            expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
        end
    end

    describe "#two_sum" do 
        it "finds all pairs of positions where the elements sum to zero" do 
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end

        it "smaller first elements come first" do 
            [[0, 4], [2, 3]].each do |sub|
                expect(sub[0]).to be <= sub[1]
            end
        end
    end

    
end

describe "#my_transpose" do
    it "converts between the row-oriented and column-oriented representations" do
        rows = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
            ]
        cols = [
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
            ]
        expect(my_transpose(rows)).to eq(cols)
    end
end

describe "#stock_picker" do
    it "returns the most profitable pair of days" do
        expect(stock_picker([1, 10, 5, 0, 50, 30, 80])).to eq([3,6])
    end

    it "returns array with smaller index before bigger index" do
        a = [3,6]
        expect(a[0]).to be < a[1]
    end
end

#if chosen array is NOT empty, then need to compare
#element shifted out has to be smaller than the first element of array chosen

describe Game do 
    describe "#move" do 
        it "shifts first element from one array and unshifts onto another" do
            context "if chosen array is not empty, compare shifted element with chosen array's first element" do 
                # if first_arr chosen is 1, 
                # and second array chosen is 3,
                # element = first_arr.shift
                # unshift only if element < 3rd[0]
            end
        end
    end
end
