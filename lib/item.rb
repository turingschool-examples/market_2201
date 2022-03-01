require 'pry'

class Item
  attr_reader :name, :price

  def initialize(hash)
    @name = hash[:name]
    @price = hash[:price].delete('$').to_f
  end

  
end
