class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
        @user = user
        @scope = scope
    end

    def resolve
        if @user.nil? || @user.standard?
            scope.where(private: false)
        else
           @scope.all
        end
    end
  end

  def destroy?
      @current_user.admin? || @current_user == @wiki.user
  end
end
