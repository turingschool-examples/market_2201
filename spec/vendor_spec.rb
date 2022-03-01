require 'pry'
require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do

  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'exists' do
    expect(@vendor).to be_a Vendor
  end

  it 'has readable attributes' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  it 'checks the item stock' do
    expect(@vendor.check_stock(@item1)).to eq 0
  end

  it "stocks the inventory and checks if the items are in the inventory" do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to include(@item1)
    expect(@vendor.inventory).to include(@item2)
    expect(@vendor.check_stock(@item1)).to eq 30
    expect(@vendor.check_stock(@item2)).to eq 12
    expect(@vendor.check_stock(@item3)).to eq 0
  end




end
