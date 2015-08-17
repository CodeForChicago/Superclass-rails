require "spec_helper"

describe FeedbackController do
  describe 'POST create' do
    it 'sends an email' do
      test_authorize_session
      expect {post :create, email: {
        body: Faker::Lorem.paragraph
      }}.to change { ActionMailer::Base.deliveries.count  }.by(1)
    end
  end
end
