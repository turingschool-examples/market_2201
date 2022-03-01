require "./lib/item"
require "./lib/vendor"

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
end
