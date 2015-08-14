require 'spec_helper'


describe CommentsController do
	describe 'POST' do
		it 'adds a comment to the database' do
			question = create(:question)
			user = create(:user)
			expect {
				post :create, comment: {
					body: "Hello, I am a comment",
					question: question.id,
					user: user.id
				}
			}.to change(Comment, :count).by 1
		end
	end
end