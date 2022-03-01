require './lib/item'
require './lib/vendor'
require './lib/market'
require 'rspec'
require 'pry'

describe Market do
  it "has a name and is a thing" do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market).to be_a(Market)
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it "can have vendors" do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it "can list vendors stuff" do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
  end

  it "finds potential_revenue" do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(vendor1.potential_revenue).to eq(29.75)
    expect(vendor2.potential_revenue).to eq(345.00)
    expect(vendor3.potential_revenue).to eq(48.75)

  end

  it "lists all inventory" do
    market = Market.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    vendor1 = Vendor.new("Rocky Mountain Fresh")

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    vendor2 = Vendor.new("Ba-Nom-a-Nom")

    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)

    vendor3 = Vendor.new("Palisade Peach Shack")

    vendor3.stock(item1, 65)
    vendor3.stock(item3, 10)

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    # expect(market.total_inventory).to eq(
    #   {
    #     item1 => {
    #     quantity: 100,
    #     vendors: [vendor1, vendor3]
    #     },
    #     item2 => {
    #       quantity: 7,
    #       vendors: [vendor1]
    #     },
    #     item4 => {
    #       quantity: 50,
    #       vendors: [vendor2]
    #     },
    #     item3 => {
    #       quantity: 35,
    #       vendors: [vendor2, vendor3]
    #     }
    #   }
    # )

    expect(market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    expect(market.overstocked_items).to eq([item1])
  end
end
