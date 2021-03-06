class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.choices.build
    @question.choices.build
    @question.choices.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:question, choices_attributes: [ :choice ] )
  end
end
