class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user || User.new
    authorize @user, :index?
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    @user = current_user || User.new
    authorize @user, :index?
  end
end
