class UsersController < ApplicationController
  def index
    @author = User.all
  end

  def show
    @user_id = params[:id]
    @user = User.where(id: @user_id)
  end
end
