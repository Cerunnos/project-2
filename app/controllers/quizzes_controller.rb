class QuizzesController < ApplicationController

  def index

  end

  def show

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

private

  def quiz_params
    params.require(:quiz).permit(:title)
  end



end
