class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token
  attr_reader :password
  def self.find_by_credentials(username, password)
    @user = user.find_by(username: username)
    return nil unless @user
    @user.isPassword(password) ? @user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def isPassword?(password)
    Bcrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
