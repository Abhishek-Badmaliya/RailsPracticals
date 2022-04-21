class CreateAnorders < ActiveRecord::Migration[7.0]
  def change
    create_table :anorders do |t|
      t.integer :quantity
      t.decimal :total_price
      t.integer :anproduct_id
      
      t.timestamps
    end
  end
end
