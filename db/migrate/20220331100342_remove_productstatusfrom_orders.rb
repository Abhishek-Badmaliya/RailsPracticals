class RemoveProductstatusfromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :product_status, :string
  end
end
