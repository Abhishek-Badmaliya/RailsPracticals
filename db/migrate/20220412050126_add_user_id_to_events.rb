class AddUserIdToEvents < ActiveRecord::Migration[7.0]
  def up
    add_reference :events, :usser
  end
  def down
    remove_reference :events, :usser
  end
end
