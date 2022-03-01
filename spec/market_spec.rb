require 'pry'
require './lib/vendor'
require './lib/item'
require './lib/market'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
  end

  it "exists" do
    expect(@market).to be_a Market
  end

  it 'has retrievable attributes' do
    expect(@market.name).to eq "South Pearl Street Farmers Market"
    expect(@market.vendors).to eq []
  end

  it 'can add vendors to the market' do
    expect(@market.vendors).to eq []
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    expect(@market.vendors).to eq [@vendor1, @vendor2, @vendor3]
  end

  it 'can get the vendor names for the entire market' do
    expect(@market.vendor_names.length).to be 3
    expect(@market.vendor_names).to include @vendor1.name
  end

end
