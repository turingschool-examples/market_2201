require 'rspec'
require './lib/item'

RSpec.describe Item do
  before (:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
  end

  it "exists" do
    expect(@item1).to be_an_instance_of(Item)
  end

  it "has reaadable attributes 'name' and 'price'" do
    expect(@item1.name).to eq("Tomato")
    expect(@item1.price).to eq(0.5)
  end
end
