require 'rails_helper'

describe VotesController do
  let!(:valid_question) {Question.create(user_id: 1, title: 'hello', body: 'testquestionbody')}
  let!(:valid_answer) {Answer.create(user_id: 1, question_id: 1, body: 'testquestionbody')}
  let!(:user) {User.create(name: 'Antonio', email: 'antonio@gmail.com', password_digest: '12345')}
  let(:up_vote) {Vote.new(user_id: 1, votable_id: 1, votable_type: 'Question', votevalue: 1 )}
  let(:down_vote) {Vote.new(user_id: 1, votable_id: 1, votable_type: 'Question', votevalue: -1 )}

  context 'votes#create' do
    it 'should create a vote on a question' do
      session[:user_id] = 1
      expect {
        post :create, question_id: 1, vote: 1
      }.to change {valid_question.vote_count}.by(1)
    end
  end

    context 'votes#create' do
    it 'should create a vote on an answer' do
      session[:user_id] = 1
      expect {
      post :create, question_id: 1, answer_id: 1, vote: 1
      }.to change {valid_answer.votes.count}.by(1)
    end
  end

   context 'votes#create' do
    it 'should create a vote on a question' do
      session[:user_id] = 1
      expect {
      post :create, question_id: 1, vote: -1
      }.to change {valid_question.vote_count}.by(-1)
    end
  end

    context 'votes#create' do
    it 'should create a vote on an answer' do
      session[:user_id] = 1
      expect {
      post :create,question_id: 1, answer_id: 1, vote: -1
      }.to change {valid_answer.vote_count}.by(-1)
    end
  end
end
