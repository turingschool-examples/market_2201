require './lib/vendor'
require './lib/item'
require './lib/market'

RSpec.describe Market do

  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
  end

  describe 'Iteration 2' do

    it "exists" do
      expect(@market).to be_a(Market)
    end

    it "has a name" do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it "has vendors" do
      expect(@market.vendors).to eq([])
    end


  end




end
