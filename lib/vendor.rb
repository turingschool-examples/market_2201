require './lib/item'


class Vendor
  attr_reader :name, :item, :inventory, :stock

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    stock = @inventory.find_all {|item| item_name.count}.to_i
  end

end
