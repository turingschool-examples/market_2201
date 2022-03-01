require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do

  it 'exists and has attributes' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_an_instance_of(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end



end
