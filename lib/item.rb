class Item
  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def price_to_f
    @price.gsub('$', '').to_f
  end
end
