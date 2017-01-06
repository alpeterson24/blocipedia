class CollaboratorPolicy < ApplicationPolicy
  def new?
    @user.role == "admin" || @user.role == "premium"
  end
end
