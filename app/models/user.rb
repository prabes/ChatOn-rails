class User < ApplicationRecord
  validates :username, presence: true, length: {minimum: 3}, uniqueness: {case_sensetive: false}
  has_secure_password
  has_many :messages
end
