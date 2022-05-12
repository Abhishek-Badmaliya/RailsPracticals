class Juser < ApplicationRecord
  #add validations
  validates :first_name, :last_name, :email, :password, presence: true
end
