class User < ApplicationRecord
  has_many :ratings
  validates :auth0_sub, uniqueness: true
end
