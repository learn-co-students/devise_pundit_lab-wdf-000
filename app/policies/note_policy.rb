class NotePolicy < ApplicationPolicy
  attr_reader :current_user, :note
  def initialize(current_user, record)
    @current_user = current_user
    @note = record
  end

  def update?
    @note.user_id == current_user.id || current_user.admin?
  end

  def destroy?
    @note.user_id == current_user.id || current_user.admin?
  end

  def show?
    @note.user_id == current_user.id || current_user.admin?
  end
end
