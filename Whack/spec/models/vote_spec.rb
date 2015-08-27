require 'rails_helper'

describe Vote do
  let!(:valid_question) {Question.create(user_id: 1, body: 'testquestionbody')}
  let!(:user) {User.create(name: 'Antonio', email: 'antonio@gmail.com', password_digest: '12345')}
  let(:up_vote) {Vote.new(user_id: 1, votable_id: 1, votable_type: 'Question', votevalue: 1 )}
  let(:down_vote) {Vote.new(user_id: 1, votable_id: 1, votable_type: 'Question', votevalue: -1 )}
  let(:bad_vote) {Vote.new(votable_id: 1, votable_type: 'Question', votevalue: -1 )}

  it 'creates a vote if valid attributes' do
    expect(up_vote).to be_valid
    expect(down_vote).to be_valid
  end

  it 'doesnt create a vote if invalid attributes' do
    expect(bad_vote).to be_invalid
  end
end
