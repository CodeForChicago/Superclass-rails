class FeedbackMailer < ActionMailer::Base
  default to: SuperClassRails::Application.config.admin_email,
          subject: "SUPERCLASS FEEDBACK"
  def feedback_mail(username, useremail, email)
    @username = username
    @useremail = useremail
    @email = email
    mail(from: username || useremail)
  end
end
