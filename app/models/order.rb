class Order < ActiveRecord::Base
  has_one :address
  has_many :line_items
end