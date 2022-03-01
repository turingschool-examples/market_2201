require 'rspec'
require './lib/market'

describe Market do
  describe 'initialization' do
    market = Market.new("South Pearl Street Farmers Market")
    it 'has a name' do
      expect(market.name).to eq("South Pearl Street Farmers Market")
    end

    it 'starts with no vendors' do
      expect(market.vendors).to eq([])
    end
  end

  describe 'vendor management' do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    it 'can add a vendor with add_vendor' do
      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)
      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end

    it 'can return all vendor_names' do
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'vendors_that_sell(item) returns an array of vendors' do
      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end

  describe 'inventory management' do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
    vendor3.stock(item3, 10)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    it 'total_inventory counts quantity of items across all vendors' do
      expect(market.total_inventory).to eq({
        item1 => {quantity: 100, vendors: [vendor1, vendor3]},
        item2 => {quantity: 7, vendors: [vendor1]},
        item3 => {quantity: 35, vendors: [vendor2, vendor3]},
        item4 => {quantity: 50, vendors: [vendor2]}
        })
    end
  end
end
