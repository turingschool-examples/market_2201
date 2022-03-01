require './lib/item'

RSpec.describ Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'exists' do
    expect(@item1).to be_a(Item)
  end

  it 'has a name' do
    expect(@item2.name).to eq("Tomato")
  end

  it 'has a price' do
    expect(@item2.price).to eq("$0.50")
  end
end
