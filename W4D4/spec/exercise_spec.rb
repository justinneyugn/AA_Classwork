require "exercise"
require "rspec"

describe Array do
    describe "#uniq" do 
        it "removes duplicates from an array" do
            expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
        end
    end
end