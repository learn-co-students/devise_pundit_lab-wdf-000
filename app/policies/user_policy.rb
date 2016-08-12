class UserPolicy < ApplicationPolicy

  def initialize(user, user_page)
    @user = user
    @page = user_page
  end

  def index?
    @user.admin?
  end

  def show?
    @page.try(:id) == @user.try(:id) || @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.try(:id) != @page.try(:id) && @user.admin?
  end
end
