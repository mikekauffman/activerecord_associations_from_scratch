require 'spec_helper'

feature "Magazine Subscriptions" do
  scenario "Can see the subscribers and their expiration dates for a magazine subscription" do
    magazine = Magazine.create!(name: "Rock and Ice")
    bob = Subscriber.create!(name: "Bob Smith")
    sue = Subscriber.create!(name: "Sue Jones")

    bob_expiration_date = 2.years.from_now
    Subscription.create!(magazine_id: magazine.id, subscriber_id: bob.id, expires_on: bob_expiration_date)

    sue_expiration_date = 1.year.from_now
    Subscription.create!(magazine_id: magazine.id, subscriber_id: sue.id, expires_on: sue_expiration_date)

    visit magazine_path(magazine)

    within(".subscriptions") do
      expect(page).to have_content bob_expiration_date.strftime("%F")
      expect(page).to have_content sue_expiration_date.strftime("%F")
    end

    within(".subscribers") do
      expect(page).to have_content "Bob Smith"
      expect(page).to have_content "Sue Jones"
    end
  end
end