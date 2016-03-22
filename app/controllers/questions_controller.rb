class QuestionsController < ApplicationController
  before_action :authorize, only: [:new]
  before_action :set_question, only: [:show]
  before_action :current_user_is_question_author?, only: [:show]

  def index
    @questions = Question.order(created_at: :desc)
    @number_of_questions_today = Question.count_today
    @number_of_answers_today = Answer.count_today
  end

  def show
    if @question.user
      @user = @question.user
    else
      @user = User.new(name: 'Deleted User')
    end
    @best_answer = @question.answers.find_by(best_answer: true)
    @answers = @question.answers.order(created_at: :desc)
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

  def current_user_is_question_author?
    @user_is_author = (@question.user == current_user)
  end
end
