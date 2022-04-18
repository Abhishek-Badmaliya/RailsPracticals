class Ancustomer < ApplicationRecord
  #add validations
  validates :email, presence: true,uniqueness:{case_sensitive:false}
  validates :name, :phone_number, presence: true
end
