class Item
  attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price].delete_prefix("$").to_f
  end
end
