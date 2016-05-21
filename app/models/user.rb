class User < ActiveRecord::Base
  # A user has many posts. Upon user deletion, delete all his posts
  has_many :posts , dependent: :destroy
  has_secure_password

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :name, presence:true, uniqueness:true
end
