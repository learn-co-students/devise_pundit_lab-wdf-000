class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  # This avoids displaying the error when authorization from Pundit fails
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def about
    render 'welcome/about'
  end

  private

  def user_not_authorized
    redirect_to '/', alert: 'Access denied.'
  end
end
