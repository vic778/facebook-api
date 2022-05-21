class PostSerializer < ActiveModel::Serializer
  attributes :id, :description, :image, :created_at, :updated_at
  has_one :user
  has_many :comments
end
