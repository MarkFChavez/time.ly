class User < ActiveRecord::Base
  validates :provider, :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
end
