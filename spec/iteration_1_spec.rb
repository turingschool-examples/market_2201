require 'pry'
require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it "#exists" do
    expect(@item1).to be_an_instance_of(Item)
  end

  it "has attributes" do
    expect(@item1.name).to eq("Peach")
  end

end
