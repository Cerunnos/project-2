class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all

  end

  def show
    @quiz=Quiz.find_by(id: params[:id])
  end

  def new
    @quiz=Quiz.new
    @quiz.questions.build
  end

  def create
    @quiz=Quiz.new(quiz_params)
    @quiz.user_id=session[:user_id]
    @quiz.save
    redirect_to new_question_path
  end

  def take_quiz
    @quiz = Quiz.find_by(id: params[:quiz_id])
  end

  def grade_quiz
    @quiz=Quiz.find_by(id: params[:quiz_id])
    params.each do |k,v|
      if Question.find_by(id: k)
        q=Question.find(k)
        q.answers.each do |a|
          if a.result == v && a.solution? == true
            'User is correct'
          else
            'User is wrong'
          end
        end
      end
    end
    redirect_to "/quizzes/#{@quiz.id}/results_quiz"
  end


def edit
  @quiz = Quiz.find_by(id: params[:id])
end

def update
  @quiz = Quiz.find_by(id: params[:id])
  @quiz.update(quiz_params)
  @quiz.save
  redirect_to quiz_path(@quiz)
end

def destroy
    @quiz = Quiz.find_by(id: params[:id])
    @quiz.destroy
    redirect_to quizzes_path
  end


private

  def quiz_params
    params.require(:quiz).permit(:title)
  end



end
