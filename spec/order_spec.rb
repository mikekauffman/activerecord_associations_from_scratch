require 'spec_helper'

feature 'Orders' do
  scenario 'Can see the line items and the address for an order' do
    order = Order.create!(number: "ABC123")

    LineItem.create!(order_id: order.id, description: "iMac")
    LineItem.create!(order_id: order.id, description: "AppleTV")
    Address.create!(order_id: order.id, line1: '123 Easy Street')

    visit order_path(order)

    within(".order-id") do
      expect(page).to have_content "ABC123"
    end

    within(".line-items") do
      expect(page).to have_content "iMac"
      expect(page).to have_content "AppleTV"
    end

    within(".address") do
      expect(page).to have_content "123 Easy Street"
    end
  end
end