class NotePolicy < ApplicationPolicy
  attr_reader :note

  def initialize(user, note)
   super(user, note)
   @note = record
  end
  
  def index?
    user.admin? || user.moderator?
  end

  def show?
    user.admin? || user.moderator? || note.try(:user) == user
  end

  def update?
    user.admin? || note.try(:user) == user
  end

  def destroy?
    user.admin? || note.try(:user) == user
  end

end