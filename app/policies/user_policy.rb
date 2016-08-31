class UserPolicy < ApplicationPolicy
  def initialize(user, params_user)
    @user = user
    @params_user = params_user
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin? || @user == @params_user
  end

  def update?
    @user.admin? || @user == @params_user
  end

  def destroy?
    @user.admin?
  end
end
