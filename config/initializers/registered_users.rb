class RegisteredUsers
  @@users = {}
  @@logged_user = ""

  def add(name, email, password)
    @@users.merge!(email.to_sym => { name: name, password: password })
  end

  def all
    @@users
  end

  def already_exist?(email)
    return true unless @@users[:"#{email}"].nil?

    false
  end

  def authenticate(email, given_password)
    if already_exist?(email) && @@users[:"#{email}"][:password] == given_password
      { email: email, name: @@users[:"#{email}"][:name] }
    end
  end

  def set_logged_user(email)
    @@logged_user = email
  end

  def logged_user
    @@logged_user
  end

  def loggout_user
    @@logged_user = ""
  end
end

USERS = RegisteredUsers.new