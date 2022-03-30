class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :fname, :lname, :phone_number, presence: true
  validates :email, presence: true, uniqueness:{case_sensitive:false}
end
