require './lib/item.rb'
require './lib/vendor.rb'

RSpec.describe Vendor do
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})
  item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  vendor1 = Vendor.new("Rocky Mountain Fresh")
  vendor2 = Vendor.new("Ba-Nom-a-Nom")
  vendor3 = Vendor.new("Palisade Peach Shack")

  it 'Initializes' do
    expect(vendor1).to be_a(Vendor)
  end

  it 'has a name and an initial empty stock' do
    expect(vendor1.name).to eq("Rocky Mountain Fresh")
    expect(vendor1.inventory).to eq({})
  end

  it 'checks stock for a given Item, returns quantity or 0 if none' do
    expect(vendor1.check_stock(item1)).to eq(0)
  end

  it 'can stock an Item given an instance and a quantity' do
    vendor1.stock(item1, 30)
    expect(vendor1.check_stock(item1)).to eq(30)
    vendor1.stock(item1, 25)
    expect(vendor1.check_stock(item1)).to eq(55)
    vendor1.stock(item2, 12)
    expect(vendor1.check_stock(item2)).to eq(12)
  end

  it 'returns an updated inventory as items are stocked' do
    expect(vendor1.inventory).to eq({item1 => 55, item2 =>12})
  end

  it "calculates potential revenue" do
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)

    expect(vendor1.potential_revenue).to eq(29.75)
    expect(vendor2.potential_revenue).to eq(345.00)
    expect(vendor3.potential_revenue).to eq(48.75)
  end
end
