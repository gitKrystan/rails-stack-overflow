class AnswersController < ApplicationController
  before_action :authorize, only: [:new]
  before_action :set_question, only: [:new, :create, :update]
  before_action :set_answer, only: [:update]

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

  def update
    current_best_answer = @question.answers.find_by(best_answer: true)
    if @answer.update(answer_params)
      if answer_params[:best_answer]
        current_best_answer.update(best_answer: false) if current_best_answer
      end
      flash[:notice] = "Best answer has been changed"
      redirect_to @question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :best_answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
