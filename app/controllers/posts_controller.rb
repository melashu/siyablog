class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
  end

  def show
    @user = params[:user_id]
    @post_id = params[:id]
  end
end
