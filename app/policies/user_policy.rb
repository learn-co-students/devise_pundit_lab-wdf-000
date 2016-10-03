class UserPolicy < ApplicationPolicy
  # These policies deal with allowing access to user pages.
  # These have nothing to do with Notes

  def index?
    user.admin?
  end

  def show?
    user.admin? || record.id == user.id
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
