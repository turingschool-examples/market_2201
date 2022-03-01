require './lib/vendor'
require './lib/item'

class Market
attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end


end
