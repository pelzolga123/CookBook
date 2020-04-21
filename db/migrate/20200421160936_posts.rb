class Posts < ActiveRecord::Migration[6.0]
  def change
     create_table :posts do |t|
      t.text :content
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, %i[user_id created_at]
  end
end
