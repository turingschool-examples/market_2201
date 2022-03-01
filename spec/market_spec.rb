require 'rspec'
require './lib/market'

describe Market do
  describe 'initialization' do
    market = Market.new("South Pearl Street Farmers Market")

    it 'has a name' do
      expect(market.name).to eq("South Pearl Street Farmers Market")
    end

    it 'starts with no vendors' do
      expect(market.vendors).to eq([])
    end
  end
end
