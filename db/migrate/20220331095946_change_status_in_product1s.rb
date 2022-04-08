class ChangeStatusInProduct1s < ActiveRecord::Migration[7.0]
  def change
    change_column :product1s, :status, :integer
  end
end
