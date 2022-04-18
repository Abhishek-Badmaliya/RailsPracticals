class CreateAnproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :anproducts do |t|
      t.string :product_name
      t.string :product_description
      t.decimal :product_price

      t.timestamps
    end
  end
end
