class QuestionsController < ApplicationController

  def index

    @quiz = Quiz.find_by(id: params[:id])
    @questions = @quiz.questions

  end

  def show

      @question = Question.find_by(id: params[:id])
  #     return @quiz
  #   else
  #   @quiz = Quiz.find_by(id: params[:id])
  #   @questions = @quiz.questions
  # end
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

    redirect_to "/questions/#{@question.id}/answers/new"
  end

  def edit
    @question = Question.find_by(id: params[:id])
end

  def update

    @question = Question.find_by(id: params[:id])
  
    @question.update(question_params)
    @question.save
    redirect_to question_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
