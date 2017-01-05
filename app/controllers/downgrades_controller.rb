class DowngradesController < ApplicationController
  def new
  end

  def update
    current_user.update_attribute(:standard true, :premium false)

    flash[:notice] = "Your account has been downgraded. You may come back anytime and upgrade."

    redirect_to root_path
  end
end
