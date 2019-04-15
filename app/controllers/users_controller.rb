class UsersController < ApplicationController

  def index
    @users = User.all
    # authorize current_user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def delete
    
  end
end
