class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = current_user
    if params[:id].to_i != @user.id
      flash[:notice] = 'Access denied.'
      return redirect_to root_path
    end
  end
end
