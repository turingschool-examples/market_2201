require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe 'Iteration 3' do
  market = Market.new("South Pearl Street Farmers Market")
  vendor1 = Vendor.new("Rocky Mountain Fresh")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: "$0.50"})
  item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: "$5.30"})
  item4 = Item.new({name: 'Banana Nice Cream', price: "$4.25"})
  vendor1.stock(item1, 35)
  vendor1.stock(item2, 7)
  vendor2 = Vendor.new("Ba-Nom-a-Nom")
  vendor2.stock(item4, 50)
  vendor2.stock(item3, 25)
  vendor3 = Vendor.new("Palisade Peach Shack")
  vendor3.stock(item1, 65)
  vendor3.stock(item3, 10)
  market.add_vendor(vendor1)
  market.add_vendor(vendor2)
  market.add_vendor(vendor3)

  it 'Shows total inventory of all vendors by item' do
    expect(market.total_inventory.count).to eq(4)
    expect(market.total_inventory[item4][:quantity]).to eq(50)
    expect(market.total_inventory[item1][:vendors]).to eq([vendor1, vendor3])
  end

  it 'Finds overstocked items' do
    expect(market.overstocked_items).to eq([item1])
  end
end

