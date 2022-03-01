require '../lib/market'
require '../lib/vendor'
require '../lib/item'
require 'date'

RSpec.describe Market do

before(:each) do
  @item1 = Item.new({name: 'Peach', price: "$0.75"})
  @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  @item5 = Item.new({name: 'Onion', price: '$0.25'})
  @market = Market.new("South Pearl Street Farmers Market")
  @vendor1 = Vendor.new("Rocky Mountain Fresh")
  @vendor1.stock(@item1, 35)
  @vendor1.stock(@item2, 7)
  @vendor2 = Vendor.new("Ba-Nom-a-Nom")
  @vendor2.stock(@item4, 50)
  @vendor2.stock(@item3, 25)
  @vendor3 = Vendor.new("Palisade Peach Shack")
  @vendor3.stock(@item1, 65)
  @market.add_vendor(@vendor1)
  @market.add_vendor(@vendor2)
  @market.add_vendor(@vendor3)
end


  it 'has a date' do
    expect(@market.date).to eq("01/03/2022")
  end

  it 'can sell items' do
    expect(@market.sell(@item1, 200)).to be false
    # require 'pry'; binding.pry
    expect(@market.sell(@item1, 40)).to be true
    expect(@vendor1.inventory[@item1]).to eq 0
    expect(@vendor3.inventory[@item1]).to eq 60
    @market.sell(@item4, 20)
    expect(@vendor2.inventory[@item4]).to be 30
  end

  end
