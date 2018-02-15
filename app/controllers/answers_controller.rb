class AnswersController < ApplicationController

  def index

  end

  def show

  end

  def new

    @answer=Answer.new
     @question = Question.find_by(id: params[:question_id])

  end

  def create
    @question = Question.find_by(id: params[:question_id])

    # params[:answers].each do |k,v|
    #   new_ans = @question.answers.build(result: v)
    #   new_ans.save
    # end

    solution = ""
    params[:solution].each do |key, value|
      if value == "1"
        solution = {"#{key}": value }
      end
    end

    params[:answers].each do |k,value|
      if k == solution.keys.first.to_s
        Answer.create(result: value, solution?: true, question_id: @question.id)
      else
        Answer.create(result: value, question_id: @question.id)
      end
    end

    redirect_to quiz_path(@question.quiz_id)
  end

def edit

  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])

end

def update
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    @answer.update(result: params[:answers][:result])
    redirect_to question_path(@question)
end

end
