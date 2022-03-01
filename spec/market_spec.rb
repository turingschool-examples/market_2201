require './lib/market'
require 'pry'

RSpec.describe Market do

  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe '#initialize' do
    it 'is initialized with a name' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it 'is initialized without any vendors' do
      expect(@market.vendors).to eq([])
    end
  end

  describe '#add_vendor' do
    it 'can add vendors' do
      @market.add_vendor(@vendor1)
      expect(@market.vendors).to eq([@vendor1])
    end
  end

  describe '#vendor_names' do
    it 'can return the names of its vendors' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom"])
    end
  end

  describe '#vendors_that_sell' do
    it 'can return the vendors that sell some given item' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item2, 10)
      expect(@market.vendors_that_sell(@item2)).to eq([@vendor1, @vendor2])
    end
  end 
end
