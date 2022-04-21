class Anorder < ApplicationRecord
  #add validation
  validates :quantity, presence: true

  #add association
  belongs_to :anproduct

  before_create :calculate_total_price
  before_update :calculate_total_price
  #create method for display total price on order's show page
  private
    def calculate_total_price
      product_price = Anproduct.find_by('id = ?', anproduct_id).product_price
      self.total_price = product_price * quantity.to_f
    end
end
