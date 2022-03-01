class Vendor
  attr_reader :name, :inventory
  
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    item_tag = item.name.downcase.to_sym
    if inventory.include?(item_tag)
      return inventory[item_tag][:count]
    else
      return 0
    end
  end

  def stock(item, count)
    inventory[item.name.downcase.to_sym] = {
      item: item,
      count: count
    }
  end
end