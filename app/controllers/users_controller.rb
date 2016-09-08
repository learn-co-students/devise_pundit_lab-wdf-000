class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if policy(@user) # what??
      authorize @user 
    else
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def create
    @user = User.create(params[:user])

    login @user
  end

  def destroy
  end

  private
    def login(user)
      session[:user_id] = user.id
    end
end
