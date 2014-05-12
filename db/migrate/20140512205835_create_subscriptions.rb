class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :magazine, index: true
      t.references :subscriber, index: true
      t.datetime :expires_on

      t.timestamps
    end
  end
end
