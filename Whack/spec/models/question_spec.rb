require 'rails_helper'

describe Question do

	let(:valid_question) {Question.new(user_id: 1,title: 'hello', body: 'testquestionbody')}
	let(:invalid_question) {Question.new(user_id: 1, body: '')}

	it 'is valid with a user_id and body and title' do
		expect(valid_question).to be_valid
	end

	it 'is invalid without a body' do
		invalid_question.valid?
		expect(invalid_question.errors[:body]).to include("can't be blank")
	end


end