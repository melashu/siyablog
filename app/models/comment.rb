class Comment < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  belongs_to :post

  after_save :update_comment_counter
  after_destroy :update_comment_counter_after_destroy

  private

  def update_comment_counter
    post.increment!(:comment_counter)
  end
  
  def update_comment_counter_after_destroy
    post.decrement!(:comment_counter)
  end

end
