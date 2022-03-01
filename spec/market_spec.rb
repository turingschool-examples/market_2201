require './lib/item'
require './lib/vendor'
require './lib/market'
require 'pry'


RSpec.describe Market do

  market = Market.new("South Pearl Street Farmers Market")
  vendor1 = Vendor.new("Rocky Mountain Fresh")
  vendor2 = Vendor.new("Ba-Nom-a-Nom")
  vendor3 = Vendor.new("Palisade Peach Shack")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})
  item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

  vendor1.stock(item1,35)
  vendor1.stock(item2,7)
  vendor2.stock(item4,50)
  vendor2.stock(item3,25)
  vendor3.stock(item1,65)
  vendor3.stock(item3,10)

  it 'exists and has name and inventory' do
    expect(market).to be_a(Market)
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it 'can hold multiple vendors' do
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendors).to eq([vendor1,vendor2,vendor3])
  end

  it 'can display vendors by name' do
    expect(market.vendor_names).to eq([vendor1.name,vendor2.name,vendor3.name])
  end

  it 'displays vendor that sells a certain item' do
    expect(market.vendors_that_sell(item1)).to eq([vendor1,vendor3])
    expect(market.vendors_that_sell(item4)).to eq([vendor2])
  end

  it 'allows vendors to display their potential revenue' do
    expect(vendor1.potential_revenue).to eq(29.75)
    expect(vendor2.potential_revenue).to eq(345.00)
    expect(vendor3.potential_revenue).to eq(101.75)
  end

  xit 'can display total inventory' do
    expect(market.total_inventory).to be_a(Hash)
    expect(market.total_inventory.keys.count).to eq(4)
  end

  xit 'displays overstocked items' do
    expect(market.overstocked_items).to eq([item1])
  end

end
