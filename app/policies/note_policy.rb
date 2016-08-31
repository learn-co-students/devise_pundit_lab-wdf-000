class NotePolicy < ApplicationPolicy

  def initialize(user, note)
    super(user, note)
    @note = record
  end

  def update?
    user.admin? || user.moderator? || record.try(:user) == user
  end
end
