class Juser < ApplicationRecord
  #add validations
  validates :first_name, :last_name, :email, :password, presence: true
  validate :passwordauthentication, on: :update

  #define method for changes email and password
  def passwordauthentication
    user = Juser.find_by_id(self.id)
    if ((self.password != user.password) && (self.email != user.email))
      errors.add(:base, "Entered Password is Incorrect!")
    else
      self.password = user.password
    end
  end
end
