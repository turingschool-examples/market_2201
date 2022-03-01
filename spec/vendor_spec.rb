require './lib/vendor'
require 'pry'

RSpec.describe Vendor do

  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"}
  end

  describe '#initialize' do
    it 'is initialized with a name' do
      expect(@vendor.name).to eq('Rocky Mountain Fresh')
    end

    it 'is initialized with an empty inventory' do
      expect(@vendor.inventory).to eq({}})
    end
  end

  describe '#check_stock' do
    it 'can return the current inventory of some item object' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'can add an inventory item with a quantity' do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
      expect(@vendor.check_stock(@item1)).to eq(30)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({@item1 => 30, @item2 => 12})
      expect(@vendor.check_stock(@item2)).to eq(12)
    end
  end
end
