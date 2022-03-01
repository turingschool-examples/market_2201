require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({ name: 'Peach', price: "$0.75" })
    @item2 = Item.new({ name: 'Tomato', price: '$0.50' })
  end

  it 'is initialized with name and a price' do
    expect(@item2).to be_instance_of Item
    expect(@item2.name).to eq('Tomato')
    expect(@item2.price).to eq("$0.50")
  end
end
