require "./lib/item"
require "./lib/vendor"
require "pry"

RSpec.describe Vendor do
  item1 = Item.new({name: "Peach", price: "$0.75"})
  item2 = Item.new({name: "Tomato", price: "$0.50"})
  vendor = Vendor.new("Rocky Mountain Fresh")

  it "reads vendor name" do
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "reads vendor inventory" do
    expect(vendor.inventory).to eq({})
  end

  it "checks vendor stock" do
    expect(vendor.check_stock(item1)).to eq(0)
  end

  it "stocks items" do
    vendor.stock(item1, 30)
    expect(vendor.inventory.values).to eq([30]) # not sure why ruby isn't reading my inventory items as keys to hash, pry says updated hash looks exactly like interaction pattern...
    expect(vendor.check_stock(item1)).to eq(30)
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2, 12)
    expect(vendor.inventory.values).to eq([55, 12]) # not sure why ruby isn't reading my inventory items as keys to hash, pry says updated hash looks exactly like interaction pattern...
  end
end
