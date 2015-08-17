class FeedbackMailer < ActionMailer::Base
  default to: SuperClassRails::Application.config.admin_email,
          subject: "SUPERCLASS FEEDBACK"
  def feedback_mail(user, email)
    @user = user
    @email = email
    mail(from: user.email || user.username)
  end
end
