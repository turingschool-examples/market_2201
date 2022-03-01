require './lib/item'

RSpec.describe Item do

  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe 'Iteration 1' do

    it "items exists" do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end
    it "has a name" do
      expect(@item1.name).to eq('Peach')
    end
    #  item1 = Item.new({name: 'Peach', price: "$0.75"})
    # #=> #<Item:0x007f9c56740d48...>
    #
    #  item2 = Item.new({name: 'Tomato', price: '$0.50'})
    # #=> #<Item:0x007f9c565c0ce8...>
    #
    #  item2.name
    # #=> "Tomato"s

  end


end
