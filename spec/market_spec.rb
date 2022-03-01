require './lib/item'
require './lib/vendor'
require './lib/market'
require 'pry'

RSpec.describe Market do
  let(:market) {Market.new("South Pearl Street Farmers Market")}

  describe 'iteration 2 - Market' do

    it 'exists' do
      expect(market).to be_a(Market)
    end

    it 'can read the name' do
      expect(market.name).to eq("South Pearl Street Farmers Market")
    end
  end
end
