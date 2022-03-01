require 'pry'
require './item'
require './vendor'

class Market
  attr_reader :name, :vendors

  def initialize(name, vendors = [])
    @name = name
    @vendors = vendors
  end

  def add_vendor(vendor)
    @vendors << vendor
  end
end
