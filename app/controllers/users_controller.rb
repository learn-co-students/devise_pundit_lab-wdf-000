class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_login

  def index
    @users = User.all
    unless current_user.admin?
      redirect_to '/', alert: 'Access denied.'
    end
  end

  def show
    authorize @user
  end

  def update
    @user.update(user_params)
    authorize @user
  end

  def destroy
    authorize @user
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_login
    redirect_to '/' unless current_user
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
