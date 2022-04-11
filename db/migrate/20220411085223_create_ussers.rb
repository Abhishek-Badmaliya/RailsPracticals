class CreateUssers < ActiveRecord::Migration[7.0]
  def change
    create_table :ussers do |t|
      t.string :user_name
      t.string :user_email

      t.timestamps
    end
  end
end
