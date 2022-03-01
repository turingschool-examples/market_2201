require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.describe do

  it "exist" do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor).to be_an_instance_of(Vendor)
  end

  it "has inventory" do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it "can check stock for items" do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(vendor.check_stock(item1)).to eq(0)
  end
end
