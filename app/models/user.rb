class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true
end
