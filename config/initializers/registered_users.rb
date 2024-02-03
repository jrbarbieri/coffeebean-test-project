class RegisteredUsers
  @@users = {}

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
end

USERS = RegisteredUsers.new