class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product1
  enum :order_status, [:booked, :cancelled]

  before_create :calculate_total_price
  #create method for display total price on order show page
  private
    def calculate_total_price
      product_price = Product1.where('id = ?', product1_id).pluck(:price)[0]
      self.total_price = product_price * quantity
    end
end
