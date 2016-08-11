class UsersController < ApplicationController
  def index
     @user = current_user || User.new
     authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    authorize @user
  end
end