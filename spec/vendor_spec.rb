require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.describe Vendor do

  vendor = Vendor.new("Rocky Mountain Fresh")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})

  it 'exists and has name and inventory' do
    expect(vendor).to be_a(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'can check stock of an item and add that item to inventory' do
    expect(vendor.check_stock(item1)).to eq(0)
    vendor.stock(item1,30)
    expect(vendor.inventory[item1]).to eq(30)
    expect(vendor.check_stock(item1)).to eq(30)
  end

  it 'can add ontop of exixstsing items aswell as add new items' do
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2,12)
    expect(vendor.inventory).to eq({item1=>55,item2=>12})
  end

  it 'can calculate potential revenure' do
    expect(vendor.potential_revenue).to eq(47.25)
  end
end
