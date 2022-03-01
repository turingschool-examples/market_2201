require './lib/item.rb'
require './lib/vendor.rb'

RSpec.describe Vendor do
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})
  vendor = Vendor.new("Rocky Mountain Fresh")

  it 'Initializes' do
    expect(vendor).to be_a(Vendor)
  end

  it 'has a name and an initial empty stock' do
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'checks stock for a given Item, returns quantity or 0 if none' do
    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'can stock an Item given an instance and a quantity' do
    vendor.stock(item1, 30)
    expect(vendor.check_stock(item1)).to eq(30)
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2, 12)
    expect(vendor.check_stock(item2)).to eq(12)
  end

  it 'returns an updated inventory as items are stocked' do
    expect(vendor.inventory).to eq({item1 => 55, item2 =>12})
  end
end
