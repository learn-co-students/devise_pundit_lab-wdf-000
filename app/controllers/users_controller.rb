class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    if !authorize(@user)
      flash[:notice] = "Access denied."
      redirect_to users_path
    end 
  end

end
