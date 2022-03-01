require 'pry'
require 'Monetize'

class Item

  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def name
    attributes[:name]
  end

  def price
    Monetize.parse(attributes[:price]).to_f

    ##### RSPEC MONETIZE MSG #####
    ##### phdd0@aurelius market_2201 % rspec spec/item_spec.rb
    ##### [WARNING] The default currency will change from `USD` to `nil`
    ##### in the next major release. Make sure to set it explicitly using
    ##### `Money.default_currency=` to avoid potential issues
    ##### [WARNING] The default rounding mode will change from
    ##### `ROUND_HALF_EVEN` to `ROUND_HALF_UP` in the next major release.
    ##### Set it explicitly using `Money.rounding_mode=` to avoid potential
    ##### problems..
    ##### RSPEC MONETIZE MSG #####

  end

end
