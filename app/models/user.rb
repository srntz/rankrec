class User < ApplicationRecord
  has_many :ratings
  validates :auth0_sub, uniqueness: true
  enum :role, { user: 0, admin: 1 }
end
