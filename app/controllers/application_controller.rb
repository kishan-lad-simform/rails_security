class ApplicationController < ActionController::Base

  # These code will use for setting the policy to each request. It is useful to prevent XSS and Injections.
  # In these we set upgrade_insecure_requests as true which means,the browser will automatically
  # upgrade any insecure (HTTP) requests to secure (HTTPS) requests when it needed.
  # content_security_policy do |policy|
  #   policy.upgrade_insecure_requests true
  # end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
