class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:format])
    if current_user.id != @user
      flash[:error] = "Access denied."
      redirect_to users_path
    end
  end

end
