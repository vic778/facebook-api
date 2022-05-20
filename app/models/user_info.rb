class UserInfo < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_picture, ImageUploader
  mount_uploader :cover_picture, ImageUploader

  validates :bio, presence: true
  validates :city, presence: true
  validates :from, presence: true
  validates :relationship, presence: true
end
