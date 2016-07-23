class UsersController < ApplicationController
  def index
    @user = current_user || User.new
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
