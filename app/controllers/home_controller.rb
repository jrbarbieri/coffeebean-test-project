class HomeController < ApplicationController
  def index
    return render :index if USERS.logged_user.empty?
    
    redirect_to signin_path(auth)
  end

  def authenticate
    if auth.nil?
      flash.now[:alert] = "Email or password are incorrect."
      render :index, status: :unprocessable_entity
    else
      USERS.set_logged_user(user_params[:email])
      redirect_to signin_path(auth)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def auth
    if USERS.logged_user.empty?
      USERS.authenticate(user_params[:email], user_params[:password])
    else
      USERS.get_user_data(USERS.logged_user)
    end
  end
end
