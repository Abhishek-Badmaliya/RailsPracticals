class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.string :email
      t.date :fac_dob
      t.string :desig

      t.timestamps
    end
  end
end
