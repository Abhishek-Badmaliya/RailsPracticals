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

  #it's called whenever created new or load the record
  after_initialize do |student|
    puts "The student's object has been initialized !"
  end

  #it's called whenever database record is loaded
  after_find do |student|
    puts "The student's object has been founded !"
  end

  #it's called whenever object is touched
  after_touch do |student|
    puts "The student's object has been touched !"
  end

  #it's called before the transaction begin 
  before_save do |student|
    puts "The student's object is not saved yet !"
  end

  #it's called when record updation operation completed
  after_save do |student|
    puts "The student's object has been saved successfully !"
  end

  #it's called when new record is create
  after_create do |student|
    puts "The student's object has been created !"
  end

  #it's called when object record is update
  after_update do |student|
    puts "The student's object has been updated !"
  end

  #it's called when object is destroy
  after_destroy do |student|
    puts "The student's object has been destroyed !"
  end

  before_validation :check_dob, if: Proc.new { |student| student.errors[:stu_dob] == []}

  def check_dob
    puts "Student's dob is valid!"
  end

  #it's called after destroy method
  after_destroy :first_name_invalid, if: :check_first_name

  def check_first_name
    Student.count >= 2 ? true : false
  end
    
  def first_name_invalid
    puts "Student's record has been deleted successfuly"
  end
end
