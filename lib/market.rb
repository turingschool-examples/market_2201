require './lib/item'
require './lib/vendor'

class Market

  attr_reader :name, :vendors

  def initialize (name)
    @name = name
    @vendors = []
  end

  def add_vendor (vendor_object)
    @vendors << vendor_object
  end

  def vendor_names
    @vendors.map{ |vendor| vendor.name }
  end

  def vendors_that_sell (item_object)
    @vendors.find_all{ |vendor| vendor.inventory[item_object]}
  end
  
end
