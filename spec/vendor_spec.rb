require "./lib/item"
require "./lib/vendor"

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

it "exists" do
  expect(@vendor).to be_a(Vendor)
end

it "can return attrbutes" do
  expect(@vendor.name).to eq("Rocky Mountain Fresh")
end

it "has an empty hash created for inventory" do
  expect(@vendor.inventory).to eq({})
end

it "can count the number of items in inventory" do
  expect(@vendor.check_stock(@item1)).to eq(0)
end

end
