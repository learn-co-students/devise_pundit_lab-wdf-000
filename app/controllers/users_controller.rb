class UsersController < ApplicationController
  # after_action :authorize, except: [:index]

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    render :text => 'Access denied.' unless @user.id == current_user.id
  end
end
