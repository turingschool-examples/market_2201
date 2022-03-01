require 'pry'
require './lib/item'
require './lib/vendor'

RSpec.describe do
  context 'Iteration 1' do
    before(:each) do
      @item1 = Item.new({ name: 'Peach', price: '$0.75' })
      @item2 = Item.new({ name: 'Tomato', price: '$0.50' })
    end

    it '#item attributes' do
      expect(@item2.name).to eq('Tomato')
      expect(@item2.price).to eq('$0.50')
    end
  end
end
