require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  context "Iteration 1" do
    it "exists" do
      expect(@item1).to be_an_instance_of(Item)
      expect(@item2).to be_an_instance_of(Item)
      expect(@vendor).to be_an_instance_of(Vendor)
    end

    it "has a name" do
      expect(@item2.name).to eq("Tomato")
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "has an item price" do
      expect(@item2.price).to eq(0.5)
    end

    it "has no inventory by default" do
      expect(@vendor.inventory).to eq({})
    end

    it "checks item stock" do
      @vendor.check_stock(@item1)
      expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it "can add items to inventory" do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
    end

    it "can add item quantities to stock item" do
      @vendor.stock(@item1, 30)
      @vendor.check_stock(@item1)
      expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it "can add more item quantities to stock item" do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.check_stock(@item1)
      expect(@vendor.check_stock(@item1)).to eq(55)
    end

    it "can add more items to inventory" do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({@item1 => 30, @item2 => 12})
    end
  end
end
