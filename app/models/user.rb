class User < ApplicationRecord
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  enum status: { draft: 0, completed: 1, published: 2 }
  def recent_post
    # Post.where(author: self).order(created_at: :desc).limit(3)
    posts.order(created_at: :desc).limit(3)
  end
end
