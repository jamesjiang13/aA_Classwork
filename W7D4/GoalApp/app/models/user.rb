class User < ApplicationRecord  
    validates :username, :email, :password_digest, presence: true
    validates :username, :email, uniqueness: true

    attr_reader :password
    

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        user.is_password?(password) ? user : nil
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)
    end

    
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def insure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end
    

end