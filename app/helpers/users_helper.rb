module UsersHelper
  def user_can_upgrade?(user)
        current_user == user && current_user.role == 'standard'
  end
end
