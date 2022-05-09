class CreateTproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :tproducts do |t|
      t.references :nuser, null: false, foreign_key: true
      t.string :product_name
      t.float :price
      t.text :description
      t.timestamps
    end
  end
end
