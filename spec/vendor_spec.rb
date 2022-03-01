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

  end

end
