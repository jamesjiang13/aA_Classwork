class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, uniqueness: true

    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
       
        return nil if @user.nil?
       
        @user if @user.is_password?(password)  
    end

    attr_reader :password

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        
        self.save

        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password_digest
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
end

