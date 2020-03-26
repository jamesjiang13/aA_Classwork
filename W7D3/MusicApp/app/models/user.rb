class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validates :email, uniqueness: true
    # validates :password, length: { minimum: 6, allow_nil: true }  

    attr_reader :password

    before_validation :ensure_session_token

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token # what's the purpose of this?
        SecureRandom.urlsafe_base64
    end

    def reset_session_token! # reminder: generates a new session token
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password # creates instance variable of password, why?
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

end



