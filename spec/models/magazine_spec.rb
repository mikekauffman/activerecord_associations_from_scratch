require 'spec_helper'

describe Magazine do
  it "allows a magazine to be associated with multiple subscriptions and subscribers" do
    magazine = Magazine.create!(name: "Rock and Ice")
    bob = Subscriber.create!(name: "Bob Smith")
    sue = Subscriber.create!(name: "Sue Jones")
    bob_expiration_date = 2.years.from_now
    Subscription.create!(magazine_id: magazine.id, subscriber_id: bob.id, expires_on: bob_expiration_date)
    sue_expiration_date = 1.year.from_now
    Subscription.create!(magazine_id: magazine.id, subscriber_id: sue.id, expires_on: sue_expiration_date)

    subscribers_array = magazine.subscribers.map {|subscriber| subscriber.name}
    expect(subscribers_array).to match_array(["Bob Smith", "Sue Jones"])

    expirations_array = magazine.subscriptions.map {|subscriptions| subscriptions.expires_on}
    expect(expirations_array).to match_array([bob_expiration_date, sue_expiration_date])
  end
end
