class Question < ActiveRecord::Base
	has_many	:comments
	belongs_to 	:user
	
	validates :body, presence: true
	validates :title, presence: true
	validates :user, presence: true 
end
