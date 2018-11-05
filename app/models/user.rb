class User < ApplicationRecord
  has_many :queries

  def self.build_from_omniauth(auth_hash)
    return User.new(username: auth_hash[:info][:name],
                    email: auth_hash[:info][:email],
                    uid: auth_hash[:uid],
                    provider: auth_hash[:provider])
  end

end
