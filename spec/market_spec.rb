require 'rspec'
require './lib/market'

describe Market do
  before (:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @market = Market.new("South Pearl Street Farmers Market")

    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@market).to be_an_instance_of(Market)
    end

    it 'has a name' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has a list of vendors' do
      expect(@market.vendors).to eq([])
    end
  end

    describe '#add_vendor' do
      it 'can add a vendor' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      end
    end

    describe '#vendor_names' do
      it 'can list the vendors names' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      end
    end

    describe '#vendors_that_sell' do
      it 'can tell you which vendors sell a specific item' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
        expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
      end
    end

    describe '#total_inventory' do
      it 'can tell you all items, their quantity and who sells them' do
        @vendor3.stock(@item3, 10)
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.total_inventory).to eq({@item1 => {quantity: 100, vendors: [@vendor1, @vendor3]}, @item2 => {quantity: 7, vendors: [@vendor1]}, @item4 => {quantity: 50, vendors: [@vendor2]}, @item3 => {quantity: 35, vendors: [@vendor2, @vendor3]}})
      end
    end

    describe '#overstocked_items' do
      it 'can tell you which items are overstocked' do
        @vendor3.stock(@item3, 10)
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)
        expect(@market.overstocked_items).to eq([@item1])
      end
    end

    describe '#sorted_item_list' do
      it 'can list all items sold in alphabetical order' do
      @vendor3.stock(@item3, 10)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

    describe '#sell' do
      it 'can sell items' do
        item5 = Item.new({name: 'Onion', price: '$0.25'})
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.sell(@item1, 200)).to be false
        expect(@market.sell(item5, 1)).to be false
        expect(@market.sell(@item4, 5)).to be true
        # expect(@vendor2.check_stock(@item4)).to eq(45)
      end
    end
end
