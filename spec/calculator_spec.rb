RSpec.describe "Calculator" do
  describe "#add" do
    it "returns 0 for an emptry string" do
      expect(add("")).to eq(0) 
    end
  end
end
