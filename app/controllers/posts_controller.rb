class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.where(id: @user_id)
  end

  def show
    @user = params[:user_id]
    @post_id = params[:id]
    @post = Post.find_by(id: @post_id)
  end
end
