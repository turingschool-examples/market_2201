require '.lib/item'

RSpec.describe Item do
  before(:each) do
    item1 = Item1.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'exists' do
    expect(item1).to be_a(Item)
  end

  
