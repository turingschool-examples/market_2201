class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    prev = []
    @inventory.each do |item|
      prev << (item[0].info[:price].gsub(/[^\d\.]/, '').to_f) * item[1]
    end
    prev.sum
  end
end
