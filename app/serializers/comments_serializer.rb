class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :body, :updated_at, :created_at, :user
end
