require 'rspec'
require './lib/vendor.rb'
require './lib/item.rb'
require 'pry'


RSpec.describe 'Class exists' do
  it "A returns 0" do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(item1).to be_an_instance_of(Item)
  end

  it "a returns 0" do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    expect(item2.name).to eq("Tomato")
    expect(item2.price).to eq(0.5)
  end
end
