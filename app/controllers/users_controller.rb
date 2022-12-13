class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user_id = params[:id]
  end
end
