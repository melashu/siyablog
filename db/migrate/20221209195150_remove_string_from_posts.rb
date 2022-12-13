class RemoveStringFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :string, :string
  end
end
