class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    user = User.find(params[:id])
    if authorize user
      @user = current_user
    else
      flash[:alert] = "Access denied."
    end
  end

  def update
  end

  def destroy
  end
end
