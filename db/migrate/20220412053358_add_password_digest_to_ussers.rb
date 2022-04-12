class AddPasswordDigestToUssers < ActiveRecord::Migration[7.0]
  def change
    add_column :ussers, :password_digest, :string
  end
end
