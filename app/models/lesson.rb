class Lesson < ActiveRecord::Base

  validates :summary, presence: true
  validates :title, presence: true
  validates :link, presence:true
  validates :creator, presence:true

end
