require "spec_helper"

describe FeedbackController do
  describe 'POST create' do
    it 'sends an email from cfc main page' do
      test_authorize_session
      expect {post :create, email: {
        body: Faker::Lorem.paragraph
      }}.to change { ActionMailer::Base.deliveries.count  }.by(1)
    end

    it 'sends an email from cfc club page' do
    	expect {post :create, email: {
    		body: Faker::Lorem.paragraph,
    		username: Faker::Name.name,
    		useremail: Faker::Internet.email
    		}}.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
