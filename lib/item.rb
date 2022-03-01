require 'pry'

class Item
  attr_accessor :name, :price
  def initialize(info)
    @name = info[:name]
    temp_price = info[:price]
    @price = temp_price[1..-1].to_f
  end
end
