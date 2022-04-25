class CreateNaddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :naddresses do |t|
      t.references :nemployee, null: false, foreign_key: true
      t.string :house_name
      t.string :street_name
      t.string :road
      t.timestamps
    end
  end
end
