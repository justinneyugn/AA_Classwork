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