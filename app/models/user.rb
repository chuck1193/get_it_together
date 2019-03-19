class User < ApplicationRecord
  has_many :lists
  has_many :invitations
  has_many :invited_lists, through: :invitations, source: :list
  has_many :tasks, through: :lists

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
