module V1
  class LessonsSerializer < ActiveModel::Serializer

    attributes :title, :link, :creator, :summary, :id

  end
end
