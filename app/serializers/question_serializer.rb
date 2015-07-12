class QuestionSerializer < ActiveModel::Serializer
	attributes  :title, :updated_at, :created_at, :id, :body, :comments
  	has_one     :user, serializer: V1::UserSerializer
end