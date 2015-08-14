require 'spec_helper'

describe LessonsController do
  describe 'GET index' do
    it 'returns http success' do
      get 'index'

      expect(response).to be_success
    end

    it 'returns all the lessons' do
      lesson1 = create(:lesson)
      lesson2 = create(:lesson)


      get :index
      # Assigns is a hash,
      # #accessible within rails test,
      # #containing all instance variable that would be available to view
      # allows for you to look up with a symbol.
      # assigns[:lessons] == assigns["lessons"]

      expect(assigns[:lessons]).to match_array([lesson1, lesson2])

    end

  end
  
describe 'GET show' do
	it 'returns a single question, given a parameter' do
    lesson1 = create(:lesson)
    lesson_id = lesson1.id
		get :show, id: lesson_id
    
    expect(assigns[:lesson]).to match(lesson1)
	end
end

  describe 'POST create' do
    it 'creates new lesson record' do
      test_authorize_session
      expect{
        post :create, lesson: {
            title: "Code For Chicago Lessons",
            link: "https://www.codingforchicago.com/lessons",
            creator: "Master D",
            summary: "I am a paragraph long."}
      }.to change(Lesson, :count).by(1)
    end
  end

end
