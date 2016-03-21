class QuestionsController < ApplicationController
  before_action :authorize, only: [:new]
  before_action :set_question, only: [:show]

  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    if @question.user
      @user = @question.user
    else
      @user = User.new(name: "Deleted User")
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
