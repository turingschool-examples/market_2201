require '../lib/market'
require '../lib/vendor'
require '../lib/item'

RSpec.describe Market do

  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'exists' do
    expect(@market).to be_a(Market)
  end

  it 'has a name' do
    expect(@market.name).to eq 'South Pearl Street Farmers Market'
  end


  it 'starts with no vendors' do
    expect(@market.vendors).to eq([])
  end

end
