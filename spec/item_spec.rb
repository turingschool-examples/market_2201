require 'pry'
require './lib/item'

RSpec.describe do
  context 'Iteration 1' do
    before(:each) do
      @item = item = Item.new({ name: 'Peach', price: '$0.75' })
    end

    it 'exists' do
      expect(@item).to be_an_instance_of(Item)
    end
  end
end
