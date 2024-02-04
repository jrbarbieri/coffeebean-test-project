class SigninController < ApplicationController
  def index
    user_ip_data = IpDataService.call(request.remote_ip)

    if user_ip_data.dig("bogon")
      fake_data
    else
      {
        name: params[:name],
        email: params[:email],
        city: user_ip_data.dig("city"),
        region: user_ip_data.dig("region"),
        country: user_ip_data.dig("country")
      }
    end

    @data = {name: params[:name], email: params[:email], city: "Salvador", region: "Northeast", country: "Brazil"}
  end

  def logout
    USERS.loggout_user
    redirect_to root_path, notice: 'User successfully loggout.'
  end

  private

  def fake_data
    {
      name: params[:name],
      email: params[:email],
      city: "Salvador",
      region: "Northeast",
      country: "Brazil"
    }
  end
end