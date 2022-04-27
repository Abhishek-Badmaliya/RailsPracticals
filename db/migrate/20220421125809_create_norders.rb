class CreateNorders < ActiveRecord::Migration[7.0]
  def change
    create_table :norders do |t|
      t.references :nproduct, null: false, foreign_key: true
      t.integer :quantity
      t.float :total_price
      t.timestamps
    end
  end
end
