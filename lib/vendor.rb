
class Vendor
  attr_reader :name, :inventory
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
    revenue_array = []
    @inventory.find_all do |item, value|
      if @inventory[item] >= 0
        revenue_array << item.price * @inventory[item]
      end
    end
    revenue = 0
    revenue_array.map do |element|
      revenue += element
    end
    revenue
  end

end
