class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show

    @user = User.find(params[:format])
    if current_user.id != @user.id
      flash[:error] = "Access denied."
      redirect_to users_path
    end

    end
end
