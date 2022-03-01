require './lib/item'


RSpec.describe Item do

  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})

  it 'exists' do
    expect(item1).to be_a(Item)
  end

  it 'has attributes name and price' do
    expect(item2.name).to eq("Tomato")
    expect(item2.price).to eq(0.5)
  end

end
