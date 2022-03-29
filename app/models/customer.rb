class Customer < ApplicationRecord
  validates :fname, :lname, :phone_number, presence: true
  validates :email, presence: true, uniqueness:{case_sensitive:false}
end
