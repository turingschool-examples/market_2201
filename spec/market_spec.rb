require "./lib/item"
require "./lib/vendor"
require "./lib/market"
require "pry"

RSpec.describe Market do
  market = Market.new("South Pearl Street Farmers Market")

  it "reads market name" do
    expect(market.name).to eq("South Pearl Street Farmers Market")
  end
end
