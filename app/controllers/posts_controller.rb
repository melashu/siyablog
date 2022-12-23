class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find_by(id: params[:user_id])
  end

  # posts/new
  def show
    @post_id = params[:id]
    @post = Post.find_by(id: @post_id)
  end

  def new
    render :new, locals: { user: current_user }
  end

  def create
    check_param
    title = params[:user][:title]
    text = params[:user][:text]
    post = Post.new(title:, text:, comment_counter: 0, like_counter: 0, author: current_user)
    if post.save
      flash[:success] = 'Post created successfuly!'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Something went wrong!'
      render :new, locals: { user: current_user }
    end
  end

  def destroy
    user_id = params[:user_id].to_i
    @user = User.find(user_id)
    @post = Post.find_by(author: @user)
    if @post.destroy
      flash[:success] = 'Post Deleted!'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Something went wrong!'
      render :index, locals: { user: current_user }
    end
  end
  private

  def check_param
    params.require(:user).permit(:title, :text)
  end
end
