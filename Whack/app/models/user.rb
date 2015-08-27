class User < ActiveRecord::Base
	has_secure_password
  has_many :questions
	has_many :answers
	has_many :comments
	has_many :votes

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
