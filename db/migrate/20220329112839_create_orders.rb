class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :total_price
      t.integer :product1_id
      t.integer :order_status
      t.integer :customer_id

      t.timestamps
    end
  end
end
