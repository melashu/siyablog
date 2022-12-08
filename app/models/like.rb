class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post

  after_save :update_like_counter

  private

  def update_like_counter
    post.increment!(:like_counter)
  end
end
