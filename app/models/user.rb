class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_post
    Post.last(3).length
  end
end
