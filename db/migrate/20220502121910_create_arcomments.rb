class CreateArcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :arcomments do |t|
      t.string :comment_content
      t.string :date_of_comment
      t.references :article, null: false, foreign_key: true
      t.timestamps
    end
  end
end
