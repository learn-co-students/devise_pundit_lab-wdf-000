class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id]) if params[:id] != "sign_out"
    if @user && current_user != @user
      flash[:notice] = "Access denied."
      @user
    else
      @user = current_user
      @user
    end
  end

end
