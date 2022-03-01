require '../lib/vendor'


RSpec.describe Vendor do

  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'exists' do
    expect(@vendor).to be_a(Vendor)
  end

  it 'has a name' do
    expect(@vendor.name).to eq 'Rocky Mountain Fresh'
  end


  it 'starts with an empty inventory' do
    expect(@vendor.inventory).to eq({})
  end

  it 'can add_stock and check_stock' do
    @vendor.stock(@item1, 30)
    expect(@vendor.check_stock(@item1)).to eq 30
    @vendor.stock(@item1, 25)
    expect(@vendor.check_stock(@item1)).to eq 55
  end



end
