class Item

  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def name
    attributes[:name]
  end

  def price
    attributes[:price]
  end

end
