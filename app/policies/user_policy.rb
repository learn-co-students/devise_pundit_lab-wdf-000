class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || record == user
    # scope.where(:id => record.id).exists?
  end

  def update?
    user.admin? || record == user
  end

  def destroy?
    user.admin?
  end

end
