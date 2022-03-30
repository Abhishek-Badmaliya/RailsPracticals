class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product1

  enum :status, [:booked, :cancelled]
end
