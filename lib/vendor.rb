require 'pry'
class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory_hash = Hash.new(0)
    @stock = Hash.new(0)
  end

  def check_stock(item)
      if @inventory_hash.find do |item|
        return  item.last
        end
      end
      return 0

  end

  def stock(item, number_of_items)
    @total_number_of_items = number_of_items
    @inventory_hash.each do |item|
      @total_number_of_items += item[1]
    end
    @inventory_hash[item] = @total_number_of_items
#    return @total_number_of_items
  end

  def inventory
    @inventory_hash
#    binding.pry
  end
end
