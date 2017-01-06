class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = @scope.all
      if @user.nil?
          wikis.select{|wiki| !wiki.private?}
      elsif @user.role == "admin" || @user.role == "premium"
          wikis
      else #standard user and/or wiki collaborator
          wikis.select{|wiki| !wiki.private? || wiki.collaborate_users.include?(@user)}
      end
    end

    def destroy?
      @current_user.admin? || @current_user == @wiki.user
    end
  end
end
