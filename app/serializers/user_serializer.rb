class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at
  has_many :user_infos
  has_many :posts
end
