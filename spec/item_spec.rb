require 'rspec'
require './lib/item'

describe Item do
  describe 'initialization' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.75"})

    it 'has a name' do
      expect(item1.name).to eq('Peach')
      expect(item2.name).to eq('Tomato')
    end

    it 'has a price' do
      expect(item1.price).to eq('$0.75')
      expect(item2.price).to eq('$0.75')
    end
  end

end
