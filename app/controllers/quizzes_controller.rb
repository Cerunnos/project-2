class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all

  end

  def show
    @quiz=Quiz.find_by(id: params[:id])
  end

  def new
    @quiz=Quiz.new
  end

  def create
    @quiz=Quiz.new(quiz_params)
    @quiz.user_id=session[:user_id]
    @quiz.save
    redirect_to new_question_path
  end

  def take_quiz
    @quiz = Quiz.find_by(id: params[:quiz_id])
    byebug
  end

  def grade_quiz

  end

private

  def quiz_params
    params.require(:quiz).permit(:title)
  end



end
