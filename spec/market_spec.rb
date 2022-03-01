require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  market = Market.new("South Pearl Street Farmers Market")
  it "exists and has readable attributes" do
    expect(market).to be_a(Market)
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end
end
