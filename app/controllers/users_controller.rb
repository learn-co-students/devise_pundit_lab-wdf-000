class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
    if authorize @users
    else
      redirect_to '/'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if authorize @user
    else
      redirect_to '/'
    end
  end
end
