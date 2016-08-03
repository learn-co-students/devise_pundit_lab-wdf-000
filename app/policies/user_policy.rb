class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user
  def initialize(current_user, record)
    @current_user = current_user
    @user = record
  end

  def index?
    current_user.admin?
  end

  def show?
    current_user == user || current_user.admin?
  end

  def update?
    current_user.admin?
  end

  def destroy?
    !current_user == user || current_user.admin?
  end
end
