class Item
  attr_reader :name
  def initialize(details)
    @details = details
    @name = details[:name]
  end

end
