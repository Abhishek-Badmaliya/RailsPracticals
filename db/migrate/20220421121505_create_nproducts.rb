class CreateNproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :nproducts do |t|
      t.string :name
      t.string :description
      t.float :price
      t.timestamps
    end
  end
end
