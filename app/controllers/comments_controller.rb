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

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(author: @user, post: @post, id: params[:id])

    if @comment.destroy
      flash[:success] = "Post was successfully deleted"
      redirect_to user_posts_path
    else
      flash[:error] = "Comment not Deleted"
      redirect_to user_posts_path
    end
  end
end
