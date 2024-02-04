class HomeController < ApplicationController
  def index
    return render :index unless current_user
    
    redirect_to signin_path
  end

  def authenticate
    if auth.nil?
      flash.now[:alert] = "Email or password are incorrect."
      render :index, status: :unprocessable_entity
    else
      session[:user_email] = user_params[:email]
      redirect_to signin_path
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def auth
    USERS.authenticate(user_params[:email], user_params[:password])
  end
end
