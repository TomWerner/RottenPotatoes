class User < ActiveRecord::Base
    def self.create_user!(user_hash)
        user_hash[:session_token] = SecureRandom.base64
        self.create!(user_hash)
    end
end