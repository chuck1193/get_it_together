class User < ApplicationRecord
  has_many :lists
  has_many :tasks, through: :lists
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
