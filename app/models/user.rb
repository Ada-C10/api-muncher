class User < ApplicationRecord
  has_many :queries

  def self.build_from_omniauth(auth_hash)
    return User.new(uid: auth_hash[:uid],
                    provider: auth_hash[:provider],
                    name: auth_hash[:info][:name])
  end

end
