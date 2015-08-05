class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :body, :updated_at, :created_at 
  has_one :user, serializer: V1::UserSerializer
end
