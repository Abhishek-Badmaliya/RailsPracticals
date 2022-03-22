class Student < ApplicationRecord

  validate :date_of_birth

  def date_of_birth
    if stu_dob.present? && stu_dob > Date.today
      errors.add(:stu_dob, "birthdate can't be in future")
    end
  end
 
  validates :first_name, :last_name, :stu_dob, presence: true
  validates :terms_of_usage, acceptance: { message: ': You cannot proceed without accepting Terms of Usage' }
  validates :dept, :inclusion => { :in => %w(IT CS), :message => "can't be %{value}" }
  
end
