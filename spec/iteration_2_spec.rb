require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe 'Iteration 2' do
  market = Market.new('South Pearl Street Farmers Market')

  it 'Has readable Market attributes' do
    expect(market.name).to eq('South Pearl Street Farmers Market')
    expect(market.vendors).to eq([])
  end

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

  it 'Adds Vendors to a Market' do
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
  end
  it 'displays names of vendors in a market' do
    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end
end