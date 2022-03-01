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

  def total_inventory
    total_inventory = Hash.new {|key, value| key[value] = key.dup.clear}
    @vendors.each do |index|
      index.inventory.each_key do |key|
        if total_inventory.include?(key)
          total_inventory[key][:quantity] += index.inventory[key]
        else
          total_inventory[key][:quantity] = index.inventory[key]
          total_inventory[key][:vendors].merge(index)
        end
      end
    end
  end
end
