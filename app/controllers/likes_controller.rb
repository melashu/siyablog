class LikesController < ApplicationController
  def create
    post_id = params[:post_id].to_i
    post = Post.find(post_id)
    like = Like.new(author: current_user, post:)
    if like.save
      redirect_to user_post_path(current_user, post)
    else
      flash[:error] = 'Something went wrong!'
      render user_post_path(current_user, post)
    end
  end
end
