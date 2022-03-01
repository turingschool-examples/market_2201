require './lib/item'
require './lib/vendor'
require './lib/market'

 RSpec.describe Market do
 	before(:each) do
 	@market = Market.new("South Pearl Street Farmers Market")

  @vendor1 = = Vendor.new("Rocky Mountain Fresh")
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

 	it 'is initialized with name and empty collection of vendors' do
 		expect(@market).to be_instance_of(Market)
    expect(@market.name).to be_a(String)
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to be_an(Array)
    expect(@market.vendors).to be_empty
 	end

  describe '#add_vendor' do
    before :each do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    end

    it 'adds a vendor to the market' do
      expected = [@vendor1, @vendor2, @vendor3]
      expect(@market.vendors). to eq(expected)
    end

    describe 'vendor_names' do
      it 'returns a collection of the names of the vendors' do
        expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      end
    end

    describe 'vendors_that_sell' do
      it 'takes item as an argument and returns a collection of all the vendors that sell that item' do
        expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
        expect(@market.vendors_that_sell(@item3)).to eq([@vendor2])
      end
    end

  end
 end
