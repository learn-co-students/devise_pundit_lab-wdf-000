class NotePolicy < ApplicationPolicy

  def create?
    user.admin?  || user.moderator? || user.user?
  end

  def update?
    user.admin?  || record.try(:user) == user
  end

  def destroy?
    user.admin? || record.try(:user) == user
  end

  def index?
    user.admin? || user.moderator?
  end

  def show?
    user.admin?  || user.moderator? || record.try(:user) == user
  end


end
