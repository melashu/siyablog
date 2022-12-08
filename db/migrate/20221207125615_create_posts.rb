class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :string
      t.text :text
      t.integer :comment_counter
      t.integer :like_counter

      t.timestamps
    end
  end
end
