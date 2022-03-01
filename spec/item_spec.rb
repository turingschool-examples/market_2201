require "./lib/item"

RSpec.describe Item do
  let(:item2) do
    Item.new({name: "Tomato", price: "$0.50"})
  end

  it "reads item name" do
    expect(item2.name).to eq("Tomato")
  end

  it "reads item price" do
    expect(item2.price).to eq(0.5)
  end
end
