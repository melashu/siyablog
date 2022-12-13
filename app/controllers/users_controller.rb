class UsersController < ApplicationController
  def index; end

  def show
    @user_id = params[:id]
  end
end
