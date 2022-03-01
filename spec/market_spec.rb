require './lib/vendor'
require './lib/item'
require './lib/market'

RSpec.describe Market do

  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
  end

  describe 'Iteration 2' do

    it "exists" do
      expect(@market).to be_a(Market)
    end


  end




end
