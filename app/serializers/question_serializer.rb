class QuestionSerializer < ActiveModel::Serializer
	attributes  :title, :updated_at, :created_at, :id, :body
  	has_one     :user, serializer: V1::UserSerializer
  	has_many	:comments, serializer: CommentsSerializer
end