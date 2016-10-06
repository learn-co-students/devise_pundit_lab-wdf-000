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


#
# class UsersController < ApplicationController
#   def destroy
#     # binding.pry
#   if current_user.admin?
#      user = User.find_by(:id => params[:id])
#      user.delete
#    end
#
#   end
#
#
#   def update
#     # binding.pry
#   if current_user.admin?
#      user = User.find_by(:id => params[:id])
#      user.update
#    end
#
#   end
#
#
#   def show
#     @user = User.find(params[:id])
#     if !current_user.admin? && current_user != @user
#       # flash[:error] = "Access denied."
#       # flash[:notice] = "Access denied."
#       flash[:alert] = "Access denied."
#     end
#   end
#
#   def index
#     @users = User.all
#   end
#
# end
