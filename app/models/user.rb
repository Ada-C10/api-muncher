class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.save!
    end
  end

  def add_to_favorites(uri)
    unless self.favorites
      self.favorites = []
    end
    
    self.favorites << uri
  end
end
