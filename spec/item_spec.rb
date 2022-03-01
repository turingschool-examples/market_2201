require 'pry'
require 'rspec'
require './lib/item.rb'

RSpec.describe do

  it 'exists' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(item1).to be_a(Item)
  end

  it 'has a name and price' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(item1.name).to eq('Peach')
    expect(item1.price).to eq("$0.75")
  end  



end
