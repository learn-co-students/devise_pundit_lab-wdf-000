class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    redirect_to user_path(@user) unless authorize @user
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    authorize @user
    unless current_user.admin? || @user == current_user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  private



end
