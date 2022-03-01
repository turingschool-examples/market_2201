require 'pry'


class Item

  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
    @stock = 0
  end

  def price
    @price = @price[1..-1].to_f
  end

end
