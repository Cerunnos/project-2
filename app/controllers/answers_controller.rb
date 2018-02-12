class AnswersController < ApplicationController

  def index

  end

  def show

  end

  def new
    @answer=Answer.new
    @question=current_user.quizzes.last.questions.last.content
  end

  def create
    @answer=Answer.new
    byebug
  end


end
