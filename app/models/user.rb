class User
  include ActiveModel::Model
  MAX_EMAIL_LOCAL_PART_CHARS = 64
  MAX_EMAIL_DOMAIN_CHARS = 128

  attr_accessor :name, :email, :password

  validates :name, presence: true, length: { minimum: 5, maximum: 128, message: "must have at least 5 letters." }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 10, maximum: 72, message: 'must have at least 10 characters.' }
  validate :password_complexity
  validate :email_complexity

  def to_hash
    { email.to_sym => { name:, password: } }
  end

  private

  def password_complexity
    return unless password.present?

    unless password.match?(/[A-Z].*[A-Z]/) &&
           password.match?(/[a-z].*[a-z]/) && 
           password.match?(/[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]/) &&
           password.match?(/[0-9]/)
      errors.add(:password, 'must include at least 2 uppercase letters, 2 lowercase letters, 2 special characters, and 1 number.')
    end
  end

  def email_complexity
    return unless email.present?
  
    unless email.match?(/[a-zA-Z0-9!#$%&'*+\-\/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]/)
      return errors.add(:email, 'must be in the format local-part@domain.TLD')
    end

    local_part, domain = email.split("@")

    unless local_part.length <= MAX_EMAIL_LOCAL_PART_CHARS
      errors.add(:email, "local part can only contain a maximum of #{MAX_EMAIL_LOCAL_PART_CHARS} characters.")
    end


    unless domain.length <= MAX_EMAIL_DOMAIN_CHARS
      errors.add(:email, "domain can only contain a maximum of #{MAX_EMAIL_DOMAIN_CHARS} characteres")
    end
  end
end