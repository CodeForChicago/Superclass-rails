class QuestionsSerializer < ActiveModel::Serializer
  
  
  attributes  :title, :updated_at, :created_at, :id, :summary
  has_one     :user, serializer: V1::UserSerializer
  
  def summary
    object.body[0..200]
  end
  
end
