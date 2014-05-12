class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :order, index: true
      t.string :line1

      t.timestamps
    end
  end
end
