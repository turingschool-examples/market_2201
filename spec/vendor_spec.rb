require 'pry'
require './lib/item'
require './lib/vendor'

RSpec.describe do
  context 'Iteration 1' do
    before(:each) do
      @item1 = Item.new({ name: 'Peach', price: '$0.75' })
      @item2 = Item.new({ name: 'Tomato', price: '$0.50' })
      @vendor = Vendor.new('Rocky Mountain Fresh')
    end

    it '#item attributes' do
      expect(@item2.name).to eq('Tomato')
      expect(@item2.price).to eq('$0.50')
    end

    it '#vendor exists' do
      expect(@vendor).to be_a(Vendor)
    end

    it '#vendor attributes' do
      expect(@vendor.name).to eq('Rocky Mountain Fresh')
      expect(@vendor.inventory).to eq({})
    end

    it '#check_stock looks up all of items in invetory' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it '#stock adds to inventory' do
      @vendor.stock(@item1, 30)

      binding.pry
      expect(@vendor.inventory).to eq(@item1 => 30)

      @vendor.stock(@item1, 25)

      expect(@vendor.inventory).to eq(@item1 => 55)
    end
  end
end
