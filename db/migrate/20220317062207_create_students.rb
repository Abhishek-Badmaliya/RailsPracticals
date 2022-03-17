class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :stu_dob
      t.string :dept

      t.timestamps
    end
  end
end
