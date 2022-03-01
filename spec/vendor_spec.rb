require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'is initialized with a name' do
    expect(@vendor).to be_instance_of Vendor
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'is initialized with an empty hash' do
    expect(@vendor.inventory).to be_a(Hash)
    expect(@vendor.inventory).to eq({})
  end

  describe '#stock' do
    before :each do
      @vendor.stock(@item1, 30)
    end

    it 'takes an item object and a quantity as arguments and places the object in the inventory' do
      expected = { @item1 => 30 }
      expect(@vendor.inventory).to eq(expected)
    end

    it '#check_stock will return updated values' do
      expect(@vendor.check_stock(@item1)).to be_an(Integer)
      expect(@vendor.check_stock(@item1)).to be(30)
    end

    it 'can add to an already existing quantity' do
      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to be(55)
    end

    # it 'can contain multiple items and quantities' do
    #   @vendor.stock(@item1, 25)
    #   @vendor.stock(@item2, 12)
    #   # expected = {@item1 => 55, @item2 => 12 }
    #   expect(@vendor.inventory).to eq(expected)
    # end

    describe '#potential_revenue' do
      before :each do
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")
        @vendor3 = Vendor.new("Palisade Peach Shack")

        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)

        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)

        @vendor3.stock(@item1, 65)
    end

    it 'returns the total amount of money to be made from entire inventory' do
      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end
end
end
