class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_only
    unless current_user && current_user.is_admin == true
      redirect_to root_path
    end
  end

end
