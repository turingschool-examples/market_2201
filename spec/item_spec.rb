require './lib/item'
require './lib/vendor'

RSpec.describe Item do
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}

  describe 'iteration 1' do

    it 'exists' do
      expect(item1).to be_a(Item)
    end
    
  end
end
