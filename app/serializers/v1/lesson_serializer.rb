module V1
  class LessonSerializer < ActiveModel::Serializer

    attributes :title, :link, :creator, :summary, :id

  end
end
