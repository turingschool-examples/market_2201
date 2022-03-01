require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.describe Vendor do
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}
  let(:vendor) {Vendor.new("Rocky Mountain Fresh")}

  describe 'iteration 2  - Vendor' do
    it 'exists and can read attributes' do
      expect(vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'has an empty inventory' do
      expect(vendor.inventory).to eq({})
    end

    it 'can check stock of an item' do
      expect(vendor.check_stock(item1)).to eq(0)
    end

    it 'can stock an item' do
      vendor.stock(item1, 30)
      expect(vendor.check_stock(item1)).to eq(30)
      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)
      binding.pry 
    end
  end
end
