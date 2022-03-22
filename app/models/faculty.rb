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

  #it's called whenever created new or load the record
  after_initialize do |faculty|
    puts "An object initialized !"
  end

  #it's called whenever database record is loaded
  after_find do |faculty|
    puts "An object found !"
  end

  #it's called whenever object is touched
  after_touch do |faculty|
    puts "An object touched !"
  end
  
  before_validation :check_for_login

  private
    def check_for_login
      if login.nil?
        self.login = email unless email.blank?
      end
    end
end
