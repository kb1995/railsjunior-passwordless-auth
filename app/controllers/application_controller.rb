class ApplicationController < ActionController::Base
  # article
  def user_class
    User
  end

  def not_authenticated
    redirect_to root_path, alert: 'Not authenticated'
  end
end
