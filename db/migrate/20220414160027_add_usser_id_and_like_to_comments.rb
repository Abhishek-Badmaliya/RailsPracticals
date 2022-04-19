class AddUsserIdAndLikeToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :usser_id, :integer
    add_column :comments, :likes, :integer
  end
end
