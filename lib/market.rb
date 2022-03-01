class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = Array.new
  end
  
end
