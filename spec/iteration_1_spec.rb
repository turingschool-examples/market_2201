require './lib/item'
require './lib/vendor'

RSpec.describe 'Iteration 1' do
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: "$0.50"})
  vendor = Vendor.new("Rocky Mountain Fresh")

  it 'has readable attributes for Item and Vendor classes' do
    expect(item2.name).to eq("Tomato")
    expect(item1.price).to eq("$0.75")
    expect(vendor.name).to eq('Rocky Mountain Fresh')
    expect(vendor.inventory).to eq({})
  end

  it 'checks stock' do
    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'adds a new stock item' do
    vendor.stock(item1, 30)
    expect(vendor.check_stock(item1)).to eq(30)
    expect(vendor.inventory).to eq({item1 => 30})
  end

  it 'adds to an existing stock item' do
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
  end

  it 'handles multiple stock items' do
    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end
end
