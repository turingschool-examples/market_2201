require './lib/item'
require 'pry'

RSpec.describe Item do

  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
  end

  describe '#initialize' do
    it 'is initialized with a name' do
      expect(@item1.name).to eq('Peach')
      expect(@item2.name).to eq('Tomato')
    end

    it 'is initialized with a price' do
      expect(@item1.price).to eq(0.75)
      expect(@item2.price).to eq(0.5)
    end
  end

end
