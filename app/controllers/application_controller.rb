class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  helper_method :current_user

  def require_admin
    unless current_user.admin?
      redirect_to events_url, alert: "Unauthorized access!"
    end
  end

  def is_admin?
    current_user && current_user.admin?
  end

  helper_method :is_admin?
end
