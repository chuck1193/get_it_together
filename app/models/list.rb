class List < ApplicationRecord
  belongs_to :user
  has_many :invitations
  has_many :users, through: :invitations
  has_many :tasks

  


end
