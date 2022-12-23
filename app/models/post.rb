class Post < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def recent_five_comment
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter
  after_destroy :update_post_counter_destroy

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def update_post_counter_destroy
    author.decrement!(:posts_counter)
  end


end
