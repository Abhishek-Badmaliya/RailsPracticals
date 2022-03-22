class Faculty < ApplicationRecord

  validate:date_of_birth,
 
  def date_of_birth
    if fac_dob.present? && fac_dob > Date.today
      errors.add(:fac_dob, "birthdate can't be in future")
    end
  end

  validates:first_name, :last_name, :fac_dob, :contact, presence:true
  validates:contact,numericality: { only_integer:true }, length:{is:10}, uniqueness:{case_sensitive:false}
 
  validates:email, presence:true, uniqueness:{case_sensitive:false}
  validates:desig,:inclusion => {:in => %w(Ass.Prof Prof),:message => "can't be %{value}" }, :exclusion => { :in => %w(HOD Sr.Prof.),:message => "%{value} is reserved." }

end
