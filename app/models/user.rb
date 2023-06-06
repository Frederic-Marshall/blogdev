class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
end
