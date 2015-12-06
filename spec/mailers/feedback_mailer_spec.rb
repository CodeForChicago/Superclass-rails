require 'spec_helper'

xdescribe FeedbackMailer do
  describe '#feedback_mail' do
    let(:user) { create(:user) }
    let(:email) { {body: "I am a body"}.to_json }
    let(:mail) { FeedbackMailer.feedback_mail(user, email) }

    it 'renders the subject' do
      expect(mail.subject).to eql('SUPERCLASS FEEDBACK')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([SuperClassRails::Application.config.admin_email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql([user.email])
    end

    it 'assigns @body' do
      e = JSON.parse email
      expect(mail.body.encoded).to match(e["body"])
    end

  end
end
