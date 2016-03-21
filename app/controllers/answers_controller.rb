class AnswersController < ApplicationController
  before_action :authorize, only: [:new]
  before_action :set_question, only: [:new, :create]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @question
    else
      render 'new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
