class UsersController < ApplicationController
  def index
    @author = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  # def destroy
  #   @user = User.find(params[:user_id])
  #   @post = Post.find_by(author:@user, id: params[:id])

  #   if @post.destroy
  #     flash[:success] = "User deleted"
  #     redirect_to users_path
  #   else
  #     flash[:error] = "Error deleting user"
  #     redirect_to users_path
  #   end

  # end
end
