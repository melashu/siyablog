class CommentsController < ApplicationController
  def new
    render :new, locals: { user: current_user }
  end

  def create
    post_id = params[:post_id].to_i
    post = Post.find(post_id)
    comment = Comment.new(text: params[:user][:text], author: current_user, post:)
    if comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path(current_user, post)
    else
      flash.now[:error] = 'Something went wrong!'
      render :new, locals: { user: current_user }, status: 302
    end
  end
end
