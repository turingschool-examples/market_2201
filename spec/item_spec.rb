require './lib/item'

RSpec.describe Item do
  it "has attributes" do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    expect(item2.name).to eq("Tomato")
    expect(item2.price).to eq(0.5)
  end
end
