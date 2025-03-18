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

    it "allows new lines between numbers (treating them as commas)" do
      expect(add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters defined in the format '//[delimiter]\n[numbers...]'" do
      expect(add("//;\n1;2")).to eq(3)
      expect(add("//|\n3|4|5")).to eq(12)
      expect(add("//-\n10-20-30")).to eq(60)
    end

    it "support special character to be used as a delimiter such that '.' or '*' " do
      expect(add("//.\n3.4.5")).to eq(12)
      expect(add("//*\n10*20*30")).to eq(60)
    end

    it "support custom delimiters along with standard delimiter ',' and '\n'" do
      expect(add("//;\n1;2,3;4\n5")).to eq(15)
    end

    it "raises an exception for negative number" do
      expect { add("1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed -2")
      expect { add("1,-2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed -2,-3")
      expect { add("\\-\n1,-2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed -2,-3")
    end

    it "ignores number bigger than 1000" do
      expect(add("//;\n1;2,3;1001\n5")).to eq(11)
    end

    it "supports custom delimiters of any length defined in the format '//[delimiter]\n[numbers...]'" do
      expect(add("//[;]\n1;2")).to eq(3)
      expect(add("//[||]\n3||4||5")).to eq(12)
      expect(add("//[---]\n10---20---30")).to eq(60)
      expect(add("//[****]\n10****20****30")).to eq(60)
    end
  end
end
