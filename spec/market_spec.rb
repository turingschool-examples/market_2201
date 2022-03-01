require './lib/item'
require './lib/vendor'
require './lib/market'

 RSpec.describe Market do
 	before(:each) do
 	@market = Market.new("South Pearl Street Farmers Market")
 	end

 	it 'is initialized with something or other' do
 		expect(@market).to be_instance_of Market
    expect(@market.name).to eq("South Pearl Street Farmers Market")
 	end
 end
