require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe 'Iteration 2' do
  market = Market.new('South Pearl Street Farmers Market')

  it 'Has readable Market attributes' do
    expect(market.name).to eq('South Pearl Street Farmers Market')
    expect(market.vendors).to eq([])
  end
end