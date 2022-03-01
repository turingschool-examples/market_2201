require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it "has attributes" do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end
end
