require 'rails_helper'

describe Comment do
	
	let(:valid_comment) {Comment.create(user_id: 1, body: 'body1', 
																			commentable_id: 1, commentable_type: 'Question') }
	let(:invalid_comment1) {Comment.create(user_id: 1, body: '', 
																			commentable_id: 1, commentable_type: 'Question') }
	let(:invalid_comment2) {Comment.create(user_id: '', body: 'body2', 
																			commentable_id: 1, commentable_type: 'Question') }


	it 'is valid with user_id, body, commentable_id and type' do
		expect(valid_comment).to be_valid
	end																		

	it 'is invalid without body' do
		invalid_comment1.valid?
		expect(invalid_comment1.errors[:body]).to include("can't be blank")
	end

	it 'is invalid without user_id' do
		expect(invalid_comment2).to be_invalid
	end


end
