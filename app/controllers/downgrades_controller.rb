class DowngradesController < ApplicationController
  def update
    current_user.update! role: 0
    redirect_to wikis_path
    flash[:notice] = "Your account has been downgraded. You may come back anytime and upgrade."
  end
end
