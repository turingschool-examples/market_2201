require 'rspec'

describe Vendor do
  describe 'initialization' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    it 'has a name' do
      expect(vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'starts with no items' do
      expect(vendor.inventory).to eq({})
    end
  end
end
