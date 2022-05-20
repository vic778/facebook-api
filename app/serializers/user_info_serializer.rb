class UserInfoSerializer < ActiveModel::Serializer
  attributes :id, :bio, :city, :from, :relationship, :profile_picture, :cover_picture, :created_at, :updated_at
  belongs_to :user
end
