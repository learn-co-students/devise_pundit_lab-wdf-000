class UsersController < ApplicationController



    def index
     @users = User.all
      authorize current_user
    end


  def show
    @user = User.find_by(id: params[:id])
      authorize @user
        unless current_user.admin? || @user == current_user
          flash[:alert] = "Access denied."
            redirect_to root_path
        end
  end


    def update
      render 'edit'
    end




end
