require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  it "has attributes" do
    market = Market.new("South Pearl Street Farmers Market")

    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end
end
