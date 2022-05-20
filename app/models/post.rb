class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :description, presence: true
  validates :image, presence: true
end