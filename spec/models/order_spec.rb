require 'spec_helper'

describe Order do
  it "allows an order to be created" do
    order = Order.create!(number: "Happiness15")
    expect(order.number).to eq ("Happiness15")
  end

  it "allows an Order to be associated with multiple line-items" do
    order = Order.create!(number: "Happiness15")
    LineItem.create!(order_id: order.id, description: "iMac")
    LineItem.create!(order_id: order.id, description: "AppleTV")
    line_item_desc_array = order.line_items.map {|line_items| line_items.description}
    expect(line_item_desc_array).to match_array(["iMac","AppleTV"])
  end

  it "allows an Order ot be associated with an address" do
    order = Order.create!(number: "Happiness15")
    Address.create!(order_id: order.id, line1: '123 Easy Street')
    expect(order.address.line1).to eq "123 Easy Street"
  end
end
