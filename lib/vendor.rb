require_relative 'item'

class Vendor

  attr_reader :name
  def initialize(name)
    @name = name
  end
end
