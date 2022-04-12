class User < ApplicationRecord
  has_secure_password
  validates :email, presence: { message: 'Email is required' }, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" }
  validates :password, length: { minimum: 6, too_short: "Password should contain more than 6 characters" }
end
