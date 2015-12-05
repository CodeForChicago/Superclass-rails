class FeedbackController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:create]

  #POST /feedback
  def create
    @email = email_params
    @user = current_user
    if FeedbackMailer.feedback_mail(@user, @email).deliver_now
      render json: @email
    else
      render json: { error: t('email_send_error') }, status: :unprocessable_entity
    end
  end

  def email_params
    JSON.parse(params.require(:email).permit(:body).to_json) 
  end
end
