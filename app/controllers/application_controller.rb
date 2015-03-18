class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_admin?

  def is_admin?
    current_user && current_user.admin?
  end

  def current_user
    if session.key?(:user_id)
      User.find(session[:user_id])
    else
      nil
    end
  end

  private

  def sign_in_user(user)
    user.record_sign_in
    session[:user_id] = user.id
  end

  def ensure_admin
    return true if is_admin?
    redirect_to root_path, notice: 'No way -- not an admin!'
  end
end
