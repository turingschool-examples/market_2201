require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do

  it 'exists and has attributes' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_an_instance_of(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'vendor can check_stock of items in inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(vendor.check_stock(item1)).to eq(0)
  end

  xit 'vendor can check_stock of items in inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    vendor.check_stock(item1)
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq(item1, 30)
  end
end
