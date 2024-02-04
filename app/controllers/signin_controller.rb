class SigninController < ApplicationController
  before_action do
    redirect_to root_path unless current_user
  end

  def index
    user_ip_data = IpDataService.call(request.remote_ip)

    @data = if user_ip_data.dig("bogon")
              fake_data
            else
              {
                name: current_user[:name],
                email: current_user[:email],
                city: user_ip_data.dig("city"),
                region: user_ip_data.dig("region"),
                country: user_ip_data.dig("country")
              }
            end
  end

  def logout
    reset_session
    redirect_to root_path, notice: 'User successfully loggout.'
  end

  private

  def fake_data
    {
      name: current_user[:name],
      email: current_user[:email],
      city: "Salvador",
      region: "Northeast",
      country: "Brazil"
    }
  end
end