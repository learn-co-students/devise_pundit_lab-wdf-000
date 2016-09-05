class UsersController < ApplicationController
  def show
  	@user = User.find_by(id: params[:id])
  	authorize @user
  end

  def index
  	@user = current_user || User.new
  	authorize @user
  end

  def destroy
  	authorize @user
  end
end
