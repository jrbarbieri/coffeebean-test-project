class ApplicationController < ActionController::Base
  def set_current_user(user)
    session[:user_email] = user.email
  end

  def current_user
    @current_user ||= User.find_by(session[:user_email])
  end

  def authenticate_user(user_params)
    user = User.find_by(user_params[:email]).try(:authenticate, user_params[:password])

    if user
      reset_session
      set_current_user(user)
    else
      reset_session
    end
  end

  def authenticated?
    redirect_to root_path unless current_user
  end
end
