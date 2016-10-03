class UserPolicy < ApplicationPolicy
  attr_reader :user
  attr_reader :record

  def initialize(user, record)
    @record = record
    @user = user
  end

  def index?
    user.admin?
  end

  def update?
    user.admin?
  end
  #
  def show?
    user == record || user.admin?
  end

  def destroy?
    user == user.admin? || user != record
  end
end
