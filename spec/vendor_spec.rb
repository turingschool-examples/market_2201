require 'rspec'
require './lib/vendor'

describe Vendor do
  describe 'initialization' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    it 'has a name' do
      expect(vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'starts with no items' do
      expect(vendor.inventory).to eq({})
    end
  end

  describe 'stocking inventory' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    it 'check_stock returns 0 if there is no items' do
      expect(vendor.check_stock(item1)).to eq(0)
    end

    xit 'can check for a certain Item' do
      vendor.stock(item1, 30)
      expect(vendor.check_stock(item1)).to eq(30)

      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)

      vendor.stock(item2, 12)
      expect(vendor.check_stock(item2)).to eq(12)
    end

    xit "inventory returns a hash with Items matched to # in stock" do
      expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
    end
  end
end
