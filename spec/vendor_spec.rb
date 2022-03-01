require './lib/item'
require './lib/vendor'

describe Vendor do
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})
  vendor = Vendor.new("Rocky Mountain Fresh")

  it "exists & has readable attributes" do
    expect(vendor).to be_a(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it "can stock and check the stock of an item" do
    expect(vendor.check_stock(item1)).to eq(0)
    vendor.stock(item1, 30)
    expect(vendor.check_stock(item1)).to eq(30)
    expect(vendor.inventory).to eq({item1 => 30})
  end

  it "can add stock of an item it already has" do
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
  end

  it "can hhave multiple items" do
    vendor.stock(item2, 12)
    expect(vendor.check_stock(item2)).to eq(12)
    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end
end
