class UserInfo < ApplicationRecord
  belongs_to :user

  validates :bio,  presence: true
  validates :city,  presence: true
  validates :from,  presence: true
  validates :relationship, presence: true
end
