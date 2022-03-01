require './lib/vendor'

RSpec.describe Vendor do

  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe 'Iteration 1' do

    it "exists" do
      expect(@vendor).to be_a(Vendor)
    end

    it "has a name" do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "has inventory" do
      expect(@vendor.inventory).to eq({})
    end

    it "can check the stock of inventory" do
      expect(@vendor.check_stock(item1)).to eq(30)
    end

  end

end
