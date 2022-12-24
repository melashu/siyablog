class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :email, :posts_counter
  has_many :post
  has_many :comment
end
