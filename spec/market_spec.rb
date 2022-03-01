require "./lib/item"
require "./lib/vendor"
require "./lib/market"
require "pry"

RSpec.describe Market do
  market = Market.new("South Pearl Street Farmers Market")
  vendor1 = Vendor.new("Rocky Mountain Fresh")
  vendor2 = Vendor.new("Ba-Nom-a-Nom")
  vendor3 = Vendor.new("Palisade Peach Shack")
  item1 = Item.new({name: "Peach", price: "$0.75"})
  item2 = Item.new({name: "Tomato", price: "$0.50"})
  item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

  it "reads market name" do
    expect(market.name).to eq("South Pearl Street Farmers Market")
  end

  it "reads market vendors" do
    expect(market.vendors).to eq([])
  end

  market.add_vendor(vendor1)
  market.add_vendor(vendor2)
  market.add_vendor(vendor3)

  it "adds vendors" do
    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
  end

  it "reads vendor names" do
    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  vendor1.stock(item1, 35)
  vendor1.stock(item2, 7)
  vendor2.stock(item4, 50)
  vendor2.stock(item3, 25)
  vendor3.stock(item1, 65)

  it "gets vendors that sell specific item" do
    expected = market.vendors_that_sell(item1) # this doesn't work presumably due to the bug in Vendor
    expect(expected).to eq([vendor1, vendor3])
    expected = market.vendors_that_sell(item4) # this doesn't work presumably due to the bug in Vendor
    expect(expected).to eq([vendor2])
  end
end
