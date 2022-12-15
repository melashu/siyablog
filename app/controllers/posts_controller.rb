class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
  end

  def show
    @user = params[:user_id]
    @post_id = params[:id]
    @post = Post.find_by(id: @post_id)
  end
end
