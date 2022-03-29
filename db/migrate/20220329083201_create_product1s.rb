class CreateProduct1s < ActiveRecord::Migration[7.0]
  def change
    create_table :product1s do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :capacity
      t.boolean :is_active
      t.string :status

      t.timestamps
    end
  end
end
