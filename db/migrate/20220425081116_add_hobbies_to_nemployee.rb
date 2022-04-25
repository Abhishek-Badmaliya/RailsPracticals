class AddHobbiesToNemployee < ActiveRecord::Migration[7.0]
  def change
    #add column of hobbies to store checkbox values
    add_column :nemployees, :hobbies, :string, array: true
  end
end
