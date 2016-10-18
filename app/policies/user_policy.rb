class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
  if !user.admin?
    if record.present?
      user.id == record.id
    end
  else
    user.admin?
  end
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end


end
