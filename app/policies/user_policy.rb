class UserPolicy < ApplicationPolicy
  def initialize(user,record)
    @user = user
    @record = record
  end

  def index?
    @record.try(:user) == @user || @user.admin?
  end

  def update?
    @record.try(:user) == @user || @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def show?
    @record == @user || @user.admin?
  end
end
