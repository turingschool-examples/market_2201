require './lib/item'
require './lib/vendor'

RSpec.describe Item do
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}

  describe 'iteration 1 - item' do

    it 'exists' do
      expect(item1).to be_a(Item)
    end

    it 'can list attributes' do
      expect(item2.name).to eq('Tomato')
      expect(item2.price).to eq('$0.50')
    end

  end
end
