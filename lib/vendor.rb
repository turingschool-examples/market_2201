require 'pry'
class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, count)
    if @inventory.keys.include?(item)
      @inventory[item] += count
    else
      @inventory[item] = count
    end
  end

  def check_stock(item_name)
    item_to_check = @inventory.find{|item, count| item == item_name}
    return 0 if item_to_check.nil?
    item_to_check[-1]
  end
end
