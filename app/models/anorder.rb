class Anorder < ApplicationRecord
  #add validation
  validates :quantity, presence: true

  #add association
  belongs_to :anproduct

  before_create :calculate_total_price
  #create method for display total price on order's show page
  private
    def calculate_total_price
      product_price = Anproduct.where('id = ?', anproduct_id).pluck(:price)[0]
      self.total_price = product_price * quantity
    end
end
