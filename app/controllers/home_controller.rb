class HomeController < ApplicationController
  def index
    return render :index unless current_user

    redirect_to signin_path
  end

  def authenticate
    if authenticate_user(user_params)
      redirect_to signin_path
    else
      flash.now[:alert] = "Email or password are incorrect."
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
