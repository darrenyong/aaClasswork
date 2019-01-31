class ApplicationController < ActionController::Base
  helper_method :require_login, :loggedin?


  def login!(user)
    session[:session_token] = user.reset_session_token
  end

  def logged_in?
    !!current_user
  end

  def logout!
    current_user.reset_session_token
    user.session_token = nil
  end

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def require_login
    redirect_to new_session_url if current_user.nil?
  end

end
