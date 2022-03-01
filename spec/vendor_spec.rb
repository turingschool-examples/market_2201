require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  context 'Iteration 1' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    vendor = Vendor.new("Rocky Mountain Fresh")

    it 'has readable attributes' do
      expect(vendor.name).to eq('Rocky Mountain Fresh')
      expect(vendor.inventory).to eq({})
    end

    it 'checks stock' do
      expect(vendor.check_stock(item1)).to eq(0)
    end

    it 'adds stock' do
      vendor.stock(item1, 30)
      expect(vendor.check_stock(item1)).to eq(30)
      expect(vendor.inventory).to eq({item1 => 30})
    end
  end
end
