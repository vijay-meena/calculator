require_relative '../calculator.rb'

RSpec.describe "Calculator" do
  describe "#add" do
    it "returns 0 for an emptry string" do
      expect(add("")).to eq(0) 
    end

    it "returns the number itslef if only one number is given" do
      expect(add("0")).to eq(0)
      expect(add("1")).to eq(1)
      expect(add("5")).to eq(5)
    end

    it "correctly sums up multiple numbers in a comma-separated string" do
      expect(add("1,2,3")).to eq(6)
      expect(add("4,5")).to eq(9)
    end
  end
end
