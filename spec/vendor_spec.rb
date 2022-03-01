require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
 it "exists" do
   vendor = Vendor.new("Rocky Mountain Fresh")
   expect(vendor).to be_a(Vendor)
 end

 it "has readable attributes" do
   vendor = Vendor.new("Rocky Mountain Fresh")
   expect(vendor.name).to eq("Rocky Mountain Fresh")
   expect(vendor.inventory).to eq({})
 end

 it "can check stock of the inventory hash" do
   item1 = Item.new({name: 'Peach', price: "$0.75"})
   vendor = Vendor.new("Rocky Mountain Fresh")
   expect(vendor.check_stock(item1)).to eq(0)
 end

 it "can add items to the inventory hash" do
   item1 = Item.new({name: 'Peach', price: "$0.75"})
   vendor = Vendor.new("Rocky Mountain Fresh")
    require 'pry'; binding.pry
   vendor.stock(item1, 30)

   expect(vendor.check_stock(item1)).to eq(30)
 end

end
