class Post < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def recent_five_comment
    Comment.last(5).length
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end