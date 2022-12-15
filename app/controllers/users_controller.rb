class UsersController < ApplicationController
  def index
    @author = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
