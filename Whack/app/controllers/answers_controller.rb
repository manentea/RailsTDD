class AnswersController < ApplicationController
  before_action :get_answer, only: [:edit, :update, :destroy ]

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def edit

  end

  # ---> needs routes
  # and view that renders form --> sending in the right variables
  # (either somehow keeping @s or creating local varibales with locals: method )

  def create
    @answer = Answer.new(answer_params)
    @answer.update(user_id: session[:user_id], question_id: params[:question_id])
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      flash[:warn] = "Sorry that answer was not created. Please try again."
      redirect_to :back
    end
  end

  def update
    @answer.update(answer_params)
    if @answer.save
       redirect_to question_path(@question)
    else
      flash[:warn] = "Sorry that answer was not created. Please try again."
      redirect_to :back
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer.destroy
    redirect_to answer_path(@answer)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def get_answer
    @answer = Answer.find(params[:id])
  end
end
