require "./lib/item"
require "./lib/vendor"

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

it "exists" do
  expect(@vendor).to be_a(Vendor)
end

it "can return attrbutes" do
  expect(@vendor.name).to eq("Rocky Mountain Fresh")
end

it "has an empty hash created for inventory" do
  expect(@vendor.inventory).to eq({})
end


end
