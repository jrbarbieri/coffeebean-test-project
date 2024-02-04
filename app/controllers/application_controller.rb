class ApplicationController < ActionController::Base
  def current_user
    return if session[:user_email].blank?

    if USERS.get_user_data(session[:user_email])
      USERS.get_user_data(session[:user_email])
    else
      reset_session
      nil
    end
  end
end
