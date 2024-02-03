class SigninController < ApplicationController
  def index
    @data = {name: params[:name], email: params[:email], city: "Salvador", region: "Northeast", country: "Brazil"}
  end

  def logout
    USERS.loggout_user
    redirect_to root_path, notice: 'User successfully loggout.'
  end
end