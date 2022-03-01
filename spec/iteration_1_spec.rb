require 'pry'
require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Item do
#  before(:each) do
#    @item1 = Item.new({name: 'Peach', price: "$0.75"})
#    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
#    @vendor = Vendor.new("Rocky Mountain Fresh")
#  end

  it "#exists for item" do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(@item1).to be_an_instance_of(Item)
  end

  it "item has attributes" do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(@item1.name).to eq("Peach")
  end

  it "#exists for vendor" do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    expect(@vendor).to be_an_instance_of(Vendor)
  end

  it "item has attributes" do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  it "#check_stock starts at 0" do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    expect(@vendor.check_stock(@item1)).to eq(0)
  end

  it "#stock adds items to inventory" do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @vendor.stock(@item1, 30)
    expect(@vendor.check_stock(@item1)).to eq(30)
    @vendor.stock(@item1, 25)
    expect(@vendor.check_stock(@item1)).to eq(55)
  end

  it "#inventory" do

    @vendor = Vendor.new("Rocky Mountain Fresh")
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)
    @vendor.inventory
#    expect(@vendor.inventory).to eq(2)
  end

end
