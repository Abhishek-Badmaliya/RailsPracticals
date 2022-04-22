class Nemployee < ApplicationRecord
  #add validations to employee inputed fields
  validates :employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, :document, presence: true

  
end
