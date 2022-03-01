require_relative 'vendor'

class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end
end
