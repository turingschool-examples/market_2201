class Item

  attr_reader :name, :price

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @price = attributes[:price]
  end

end
