class User < ActiveRecord::Base
  validates :provider, :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth auth_hash
    user = self.find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid) do |u|
      u.email = auth_hash.info.email
      u.name = auth_hash.info.name
      u.image = auth_hash.info.image
    end

    user
  end
end
