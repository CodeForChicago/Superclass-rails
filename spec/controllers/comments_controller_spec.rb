require 'spec_helper'


describe CommentsController do
	describe 'POST' do
			let(:question) { create(:question) }

		it 'adds a comment to the database' do
			test_authorize_session

			expect {
				post :create, comment: {
					body: "Hello, I am a comment",
					question: question.id
				}
			}.to change(Comment, :count).by 1
		end

        it 'returns a success' do
            test_authorize_session
            expect(response).to be_success
            
        end

		it 'returns an error if comment did not save due to RunTimeError'

		it 'returns a 401 if the user is not authorized'
	end
end
