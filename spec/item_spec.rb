require './lib/item'

RSpec.describe Item do
  context 'Iteration 1' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})

    it 'has readable attributes' do
      expect(item2.name).to eq("Tomato")
      expect(item1.price).to eq("$0.75")
    end
  end
end