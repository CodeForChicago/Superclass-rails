class QuestionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  before_action :set_question, only: [:show, :update, :destroy, :edit]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    render json: @questions, each_serializer: QuestionsSerializer, root: nil
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    render json: @question
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # EDIT /questions/1
  # EDIT /questions/1.json
  def edit 
    
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    head :no_content
  end

  private

    def set_question
      @question = Question.includes(:comments).find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :body).merge(user: current_user)
    end
end
