class CreateTproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :tproducts do |t|
      t.string :product_name
      t.float :price
      t.text :description
      t.timestamps
    end
  end
end
