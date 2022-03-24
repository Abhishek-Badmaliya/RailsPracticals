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
    puts "The faculty's object has been initialized !"
  end

  #it's called whenever database record is loaded
  after_find do |faculty|
    puts "The faculty's object has been founded !"
  end

  #it's called whenever object is touched
  after_touch do |faculty|
    puts "The faculty's object has been touched !"
  end

  #it's called before the transaction begin 
  before_save do |faculty|
    puts "An object is not saved yet !"
  end

  #it's called when record updation operation completed
  after_save do |faculty|
    puts "The faculty's object Email has been Validated !"
  end

  #it's called when new record is create
  after_create do |faculty|
    puts "The faculty's object has been created !"
  end

  #it's called when object record is update
  after_update do |faculty|
    puts "The faculty's object has been updated !"
  end

  #it's called when object is destroy
  after_destroy do |faculty|
    puts "The faculty's object has been destroyed !"
  end

  after_validation :check_dob, 
    if: Proc.new { |faculty| faculty.errors[:fac_dob] == []}

  #it's called after initialisation
  def check_dob
    puts "The faculty's object's date of birth is valid!"
  end

end
