class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    stock = @inventory[item]
  end

  def stock(item, num_items)
    @inventory[item] += num_items
  end

  def potential_revenue
    items = @inventory.map { |item, count| item }
    prices = items.map { |item| item.price.delete("$").to_f }
    num_items = @inventory.map { |item, count| count }
    product = 1
    prices.each do |price|
      product = product * price
    end
    avg_price = product / prices.count
    result = avg_price * num_items.sum

  end

  def total inventory
  end
end
