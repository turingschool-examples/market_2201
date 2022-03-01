require 'pry'
require 'rspec'
require './lib/vendor.rb'
require './lib/item.rb'
require './lib/market.rb'

RSpec.describe Market do
  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market).to be_a(Market)
  end
end
