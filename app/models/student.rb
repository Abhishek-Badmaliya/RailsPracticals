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
    puts "An object initialized !"
  end

  #it's called whenever database record is loaded
  after_find do |student|
    puts "An object found !"
  end

  #it's called whenever object is touched
  after_touch do |student|
    puts "An object touched !"
  end

  before_validation :remove_whitespaces
  def remove_whitespaces
    first_name.strip!
  end

  before_save do |student|
    puts "An object is not saved yet !"
  end

  after_save do |student|
    puts "An object is saved successfully !"
  end

  after_save :set_msge
  def set_msge
    puts "An object is saved successfully !"
  end
end
