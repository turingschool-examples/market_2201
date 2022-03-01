require './lib/item'
require './lib/vendor'

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
  end
end
