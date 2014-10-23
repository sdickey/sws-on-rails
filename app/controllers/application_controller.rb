class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_account, :is_admin?

  private

  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def authorize
    redirect_to login_path, alert: "You have to log in to do that." if current_account.nil?
  end

  def is_admin?
    @current_account.admin
  end
end
