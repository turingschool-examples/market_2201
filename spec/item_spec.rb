require 'rspec'
require './lib/item'

describe Item do
  before (:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_an_instance_of(Item)
    end

    it 'has a name' do
      expect(@item2.name).to eq("Tomato")
    end

    it 'has a price as a float' do
      expect(@item2.price).to eq(0.5)
      expect(@item2.price.class).to eq(Float)
    end
  end
end
