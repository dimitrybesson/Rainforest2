class User < ActiveRecord::Base
  has_secure_password
  validates :email, :password, :password_confirmation, presence: true
end
