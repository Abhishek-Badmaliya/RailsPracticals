class Nemployee < ApplicationRecord
  #add validations to employee inputed fields
  validates :employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, :document, presence: true
  validates :email, uniqueness: true

  HOBBIES = %i[Reading Writing Music Swimming]
  
  #add associations
  has_many :naddresses, dependent: :destroy
  accepts_nested_attributes_for :naddresses, allow_destroy: true
end
