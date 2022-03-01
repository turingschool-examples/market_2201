require 'pry'
require './lib/item'


RSpec.describe do
  it "exist" do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expect(item1).to be_an_instance_of(Item)
  end
  # binding.pry
end
