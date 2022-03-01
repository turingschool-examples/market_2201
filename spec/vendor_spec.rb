require './lib/vendor'

RSpec.describe Vendor do
  vendor = Vendor.new("Rocky Mountain Fresh")

  it 'is an instance of Vendor' do
    expect(vendor).to be_an_instance_of(Vendor)
  end

  it 'has name assigned and readable on init' do
    expect(vendor.name).to eq "Rocky Mountain Fresh"
  end

end
