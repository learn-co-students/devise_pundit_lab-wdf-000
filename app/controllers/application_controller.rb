class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pundit

  def home
     render 'welcome/home'
   end

   def about
     render 'welcome/about'
   end

   private

   def user_not_authorized
     redirect_to '/', alert: 'Access denied.'
   end

end
