require "./lib/item"
require "./lib/vendor"
require "pry"

RSpec.describe Vendor do
  let(:item1) do
    Item.new({name: "Peach", price: "$0.75"})
  end
  let(:item2) do
    Item.new({name: "Tomato", price: "$0.50"})
  end
  let(:vendor) do
    Vendor.new("Rocky Mountain Fresh")
  end

  it "reads vendor name" do
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "reads vendor inventory" do
    expect(vendor.inventory).to eq({})
  end

  it "checks vendor stock" do
    expect(vendor.check_stock(item1)).to eq(0)
  end

  it "stocks items" do
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.check_stock(item1)).to eq(30)
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end
end
