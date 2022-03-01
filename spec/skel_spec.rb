require 'pry'
require 'rspec'
#require './lib/class'

RSpec.describe Class do
  before(:each) do
  end

  it "#exists" do
    var = Class.new
    expect(var).to be_an_instance_of(Class)
  end

  it "has attributes" do
    expect(var.name).to eq("name")
  end

end
