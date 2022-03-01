class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    if !vendors.include?(vendor)
      vendors << vendor
    end
  end
end