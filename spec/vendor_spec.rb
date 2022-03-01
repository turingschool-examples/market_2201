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
  end
end
