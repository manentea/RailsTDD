class VotesController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @vote = Vote.new
  end

  def create
    if params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      vote = Vote.new(user_id: session[:user_id], votable_id: params[:answer_id])
      vote[:votable_type] = 'Answer'
      vote.update(votevalue: params[:vote])
      vote.save
      @answer.votes << vote
      redirect_to @answer.question
    elsif params[:question_id]
      @question = Question.find(params[:question_id])
      vote = Vote.new(user_id: session[:user_id], votable_id: params[:question_id])
      vote[:votable_type] = 'Question'
      vote.update(votevalue: params[:vote])
      vote.save
      @question.votes << vote
      redirect_to @question
    end
  end

  private

  def votetype
    params.require(:vote).permit(:votevalue)
  end

end
