class Norder < ApplicationRecord
  #add validation
  validates :quantity, presence: true

  #add association
  belongs_to :nproduct

  before_create :calculate_total_price
  before_update :calculate_total_price
  #create method for display total price on order's show page
  private
    def calculate_total_price
      price = Nproduct.find_by('id = ?', nproduct_id).price
      self.total_price = price * quantity.to_f
    end
end
