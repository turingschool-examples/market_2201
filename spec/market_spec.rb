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
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1])
    end
  end

  describe '#sorted_item_list' do
    it 'can return a list of names of all items the vendors have in stock, sorted alphabetically' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @vendor1.stock(@item2, 7)
      @vendor1.stock(@item1, 35)
      @vendor2.stock(@item2, 10)
      @vendor2.stock(@item4, 45)
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Tomato"])
    end
  end

  describe '#total_inventory' do
    it 'can report the quantities of all items sold t the market' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @vendor1.stock(@item2, 7)
      @vendor1.stock(@item1, 35)
      @vendor2.stock(@item2, 10)
      @vendor2.stock(@item4, 45)
      expect(@market.total_inventory).to eq({
          @item2 => {
            quantity: 17,
            vendors: [@vendor1, @vendor2]
          },
          @item1 => {
            quantity: 35,
            vendors: [@vendor1]
          },
          @item4 => {
            quantity: 45,
            vendors: [@vendor2]
          }
        }
      )
    end
  end

  describe '#overstocked_items' do
    it 'can determine if an item is sold by more than 1 vendor and has a total inventory greater than 50' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @vendor1.stock(@item2, 7)
      @vendor1.stock(@item1, 35)
      @vendor2.stock(@item2, 10)
      @vendor2.stock(@item4, 45)
      @vendor2.stock(@item1, 16)
      expect(@market.overstocked_items).to eq([@item1])
      @vendor1.stock(@item4, 15)
      @vendor2.stock(@item3, 65)
      expect(@market.overstocked_items).to eq([@item1, @item4])
    end
  end

  describe '#sell' do
    it 'can determine if there is enough of some item to sell and sell it if so' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item1, 16)
      @vendor2.stock(@item2, 10)
      @vendor2.stock(@item4, 45)
      expect(@market.sell(@item1, 45)).to eq(true)
      expect(@market.total_inventory[@item1][:quantity]).to eq(6)
      expect(@vendor1.inventory[@item1]).to eq(0)
      expect(@vendor2.inventory[@item1]).to eq(6)
    end
  end

end
