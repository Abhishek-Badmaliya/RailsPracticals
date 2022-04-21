class CreateAncustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :ancustomers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end
