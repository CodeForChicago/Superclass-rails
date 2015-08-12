class LessonsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]

  # GET /v1/lessons
  # Get all the lessons
  def index
    @lessons = Lesson.order(created_at: :desc).all
    render json: @lessons, each_serializer: LessonsSerializer, root: nil
  end

  def show
    @lesson = Lesson.find(params[:id])
    render json: @lesson, serializer: LessonSerializer
  end

  # POST /v1/lessons
  # Add a new lesson
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      render json: @lesson, serializer: LessonSerializer
    else
      render json: { error: t('story_create_error') }, status: :unprocessable_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :summary, :link, :creator)
  end


end
