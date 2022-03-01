require_relative 'item'

class Vendor
  attr_reader :inventory, :name
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(given_item)
    amount = 0
    if @inventory[:item]
      amount += @inventory[:item]
    end
    amount
  end
end
