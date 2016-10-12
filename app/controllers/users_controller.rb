class UsersController < ApplicationController

  def index
    @users = User.all
    authorize current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    # byebug

    authorize @user
    # if authorize @user
    # else
    #   flash[:alert] = "Access denied."
    #   redirect_to '/'
    # end
  end



  def destroy
    authorize current_user
  end

end
