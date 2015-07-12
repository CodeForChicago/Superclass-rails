require 'spec_helper'

describe QuestionsController do
	describe 'GET index' do
		it 'returns http success' do
			get 'index'
			
			expect(response).to be_success
		end
		it 'returns all the questions' do
			question1 = create(:question)
			question2 = create(:question)
			get :index
			expect(assigns[:questions]).to match_array([question1, question2])
			
		end
	end
	
	describe 'GET show' do
		it 'returns a single question, given a parameter' do
			question1 = create(:question)
			question_id = question1.id
			
			get :show, id: question_id
			
			expect(assigns[:question]).to match(question1)
		end
		
		it 'returns a single question w/ correct comments, given a parameter' do
			question1 = create(:question)
			question_id = question1
			
			comment1 = create(:comment, question: question1)
			comment2 = create(:comment, question: question1)
			
			get :show, id: question_id
			
			expect(assigns[:question].comments).to match_array([comment1, comment2])
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