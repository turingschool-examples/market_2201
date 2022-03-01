require './lib/item.rb'

RSpec.describe Item do

  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})

  it 'Initializes' do
    expect(item1).to be_a(Item)
    expect(item2).to be_a(Item)
  end

  it 'Provides name through attr_reader methods' do
    expect(item1.name).to eq("Peach")
    expect(item2.name).to eq("Tomato")
  end

  it 'has method price_convert that returns price as a float' do
    expect(item1.price).to eq(0.75)
  end

end
