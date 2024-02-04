class RegisteredUsers
  @@users = Rails.application.config.registered_users

  def add(user)
    @@users.merge!(user)
  end

  def already_exist?(email)
    @@users.fetch(email.to_sym, nil).present?
  end

  def authenticate(email, given_password)
    get_user_data(email) if validate_auth(email, given_password)
  end

  def get_user_data(email)
    { email: email, name: @@users[email.to_sym][:name] } if already_exist?(email)
  end

  private

  def validate_auth(email, given_password)
    already_exist?(email) && @@users[email.to_sym][:password] == given_password
  end
end

USERS = RegisteredUsers.new