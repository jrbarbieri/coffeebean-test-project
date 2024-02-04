class RegistersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      if USERS.already_exist?(user_params[:email])
        @user.errors.add(:email, 'already been registered. Try another one!')
        render :new, status: :unprocessable_entity
      else
        USERS.add(@user)
        redirect_to root_path, notice: 'User successfully created. Sign-in now!'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
