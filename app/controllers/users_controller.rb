class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
     @user = current_user || User.new
     authorize @user
  end

  def edit
  end
  def update
  end

  def show
    authorize @user
    render :text => 'Access denied.' unless @user.id == current_user.id
  end

  def destroy
    authorize @user
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
