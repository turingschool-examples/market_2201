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

  def potential_revenue
    item_prices = @inventory.keys.map{|item| item.price}
    quantitys = @inventory.values
    cost_and_count = item_prices.zip(quantitys)
    cost_and_count.map{|item| item[0] * item[1]}.sum
    # binding.pry
  end
end
