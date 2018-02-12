class QuestionsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @question=Question.new
    @question.answers.build
  end

  def create
    @question=Question.new
    @question.content=params[:question][:content]
    @question.quiz_id=current_user.quizzes.last.id
    @question.save
    redirect_to new_answers_path
  end


end
