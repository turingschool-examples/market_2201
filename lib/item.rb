require 'pry'


class Item

  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price].scan(/[.0-9]/).join().to_f
    @stock = 0
  end

end
