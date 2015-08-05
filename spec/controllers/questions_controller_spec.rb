require 'spec_helper'

describe QuestionsController do
	render_views
	describe 'GET index' do
		it 'returns http success' do
			get 'index'
			
			expect(response).to be_success
		end
		it 'returns all the questions' do
			question1 = create(:question)
			question2 = create(:question)
			get :index
			require 'pry'; binding.pry
			expect(response.body).to include({question1, question2}.to_json)
			
		end
	end
	
	describe 'GET show' do
		it 'returns a single question, given a parameter' do
			question1 = create(:question)
			question_id = question1.id
			
			get :show, id: question_id
			puts question1.to_json
			expect(assigns[:question]).to match(question1)
		end
		
		it 'returns a single question w/ correct comments, given a parameter' do
			question1 = create(:question)
			question_id = question1
			
			comment1 = create(:comment, question: question1)
			comment2 = create(:comment, question: question1)
			
			get :show, id: question_id
			puts assigns[:question].comments.inspect
			expect(assigns[:question].comments).to match_array([comment1, comment2])
		end
		
		it 'returns a comment with a username, given a parameter' do
			user1 = create(:user)
			question1 = create(:question, user: user1)
			question_id = question1
			
			comment1 = create(:comment, question: question1)
			user_name = user1.username
			get :show, id: question_id
			comment = JSON.parse(assigns[:question].comments.first.to_json)

			expect(comment.user).to match(user_name)
		end

	end
	
	describe 'POST create' do
		it 'creates new question record' do
			test_authorize_session
			userA = create(:user)
			expect{
				post :create, question: {
					title: 	"Questions",
					body:	"Here lies a question. May someone someday answer it."
				}
			}.to change(Question, :count).by(1)
		end
	end
	
end
