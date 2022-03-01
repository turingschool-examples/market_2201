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

  def items_sold
    item_list = @vendors.map {|vendor| vendor.inventory.keys}
    item_list.flatten
    item_list.uniq!
    return item_list
  end

  def total_inventory #why is quantity not updating!!!???
    output = {}
    items_sold.each do |item|
      output[item] = {vendors: [], quantity: 0}
      @vendors.each do |vendor|
        require 'pry'; binding.pry
        quantity = vendor.check_stock(item) #why you always 0 tho
        output[item][:quantity] += quantity
        output[item][:vendors] << vendor
        # require 'pry';binding.pry
      end
    end
    output
  end

end
