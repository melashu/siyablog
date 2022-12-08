class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

  def recent_post
    Post.last(3).length
  end
end
