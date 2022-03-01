require_relative 'item'
require_relative 'vendor'

class Market


  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|index| index.name}
  end

  def vendors_that_sell(item)
    @vendors.select{|index| index.check_stock(item) != 0}
  end
end
