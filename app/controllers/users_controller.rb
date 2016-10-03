class UsersController < ApplicationController

def index
  @user = current_user
  authorize @user
end

def show
  @user = User.find(params[:id])
  if !current_user.admin? && current_user != @user
     flash[:alert] = 'Access denied.'
     redirect_to root_path
    end
end

def destroy
  authorize @user
end

end
