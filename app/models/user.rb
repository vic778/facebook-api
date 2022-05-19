class User < ApplicationRecord
  has_many :user_infos

  has_secure_password

  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false
  validates :password, presence: true, allow_blank: false, length: { minimum: 6 }
  validates :password_confirmation, presence: true, allow_blank: false, length: { minimum: 6 }
end
