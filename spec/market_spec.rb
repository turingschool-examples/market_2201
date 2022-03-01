require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before (:each) do
    @market = Market.new("South Pearl Street Farmers Market")
  end

  it "exists" do
    expect(@market).to be_an_instance_of(Market)
  end


  it "has readable attribute 'name'" do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
  end

  it "has an empty array 'vendors' by default" do
    expect(@market.vendors).to eq([])
  end
end
