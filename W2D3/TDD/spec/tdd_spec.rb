require 'tdd'

RSpec.describe do
    describe "#my_uniq" do
        let(:array) {[1,2,2,3]}
        let(:uniq_array) {[1,2,3]}
        it "removes all duplicate elements" do
            expect(array.my_uniq).to eq([1,2,3])           
        end

        it "doesn't remove unique elements" do
            expect(uniq_array.my_uniq).to eq(uniq_array)
        end
    end

    describe "#two_sum" do
        let(:array) { [-1,0,2,-2,1] }
        let(:other_arr) { [2, 4, 1, 3, 0, -4, -3, -1, -2] }
        it "combines elements that sum to zero" do
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end 

        it "sorts results dictionary-style" do
            expect(other_arr.two_sum).to eq([[0,8],[1,5],[2,7],[3,6]])
        end
        
        it "returns nil when there are no elements that sum zero" do
            expect([].two_sum).to be_nil
            expect([1,2,3].two_sum).to be_nil
        end
    end

    describe "#my_transpose" do
        let (:array) {[
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
            ]}
        let (:t_array) {[
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
            ]}
        it "tranposes rows with columns and vice versa" do
            expect(array.my_transpose).to eq(t_array)
        end

        it "reverses results if applied to same array twice" do
            expect(t_array.my_transpose).to eq(array)
        end
    end

    describe "#stock_picker" do
        let(:stocks) { [50, 100, 20, 150, 500] }
        let(:downhill) { [500, 5, 5, 5, 5, 6] }
        it "outputs the most profitable buy/sell pair in days" do
            expect(stock_picker(stocks)).to eq([2,4]) 
        end

        it "doesn't return a sell day that comes before viable purchase day" do
            expect(stock_picker(downhill)).to eq([4,5])
        end
    end

    
end




