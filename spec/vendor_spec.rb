require "./lib/item"
require "./lib/vendor"

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it "exists" do
    expect(@vendor).to be_a(Vendor)
  end

  it "can return attrbutes" do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "has an empty hash created for inventory" do
    expect(@vendor.inventory).to eq({})
  end

  it "can count the number of items in inventory" do
    expect(@vendor.check_stock(@item1)).to eq(0)
  end

  it "can #stock items into the inventory" do
    @vendor.stock(@item1, 30)
    expect(@vendor.inventory).to eq({@item1 => 30})
  end

  it 'can count items in inventory with #check_stock' do
    @vendor.stock(@item1, 25)
    @vendor.stock(@item1, 30)
    expect(@vendor.check_stock(@item1)).to eq(55)
  end

  it 'can return inventory elements' do
    @vendor.stock(@item1, 25)
    @vendor.stock(@item1, 30)
    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
  end




end
