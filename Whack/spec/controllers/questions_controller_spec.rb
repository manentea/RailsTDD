require 'rails_helper'

describe QuestionsController do

	let!(:valid_question) {Question.create(user_id: 1,title: 'hello', body: 'testquestionbody')}
	# let!(:new_valid_question) {Question.create(user_id: 1, body: 'newvalidquestion')}
	let(:invalid_question) {Question.create(user_id: 1, body: '')}
	let!(:user) {User.create(name: 'Antonio', email: 'antonio@gmail.com', password_digest: '12345')}

	context 'questions#index' do
		it 'returns a successful response' do
			get :index
			expect(response).to be_success
		end

		it 'renders the index template' do
			get :index
			expect(response).to render_template :index
		end

		it 'correctly assigns variables' do
			get :index
			expect(assigns(:questions)).to eq(Question.all)
		end
	end


	context 'questions#show' do
		it 'returns a successful response' do
			get :show, id: valid_question.id
			expect(response).to be_success
		end

		it 'renders the show template' do
			get :show, id: valid_question.id
			expect(response).to render_template :show
		end

		it 'correctly assigns variables' do
			get :show, id: valid_question.id
			expect(assigns(:question)).to eq(valid_question)
		end
	end

	context 'questions#new' do
		it 'returns a successful response' do
			get :new
			expect(response).to be_success
		end
		it 'assigns a new question to @question' do
			get :new
			expect(assigns(:question)).to be_a_new Question
		end
		it 'renders new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	context 'questions#create' do
		it 'creates a question with valid attributes' do
			session[:user_id] = 1
			expect {
			  post :create, question: {title: 'hello', body: 'testquestionbody'}
			}.to change { Question.count }.by(1)
		end

		it 'doesnt create a question with invalid attributes' do
			session[:user_id] = 1
			expect {
				post :create, question: {body: ''}
			}.not_to change {Question.count}
		end
	end

	context 'questions#edit' do
		it 'assigns the correct variable to @question' do
			get :edit, id: valid_question.id
			expect(assigns(:question)).to eq(valid_question)
		end

		it 'renders the edit template ' do
			get :edit, id: valid_question.id
			expect(response).to render_template :edit
		end
	end

	context 'questions#update' do

		# it 'changes the correct attribute' do
		# 	session[:user_id] = 1
  #     patch :update, id: valid_question, question: {body: 'newvalidquestion'}
  #     valid_question.reload
  #     expect(assigns(:question).body).to eq('newvalidquestion')
  #   end

   # ---> passes test but with wrong ID !!!

    it 'doesnt change the attribute if it is invalid' do
    				session[:user_id] = 1

      expect{
        patch :update, id: valid_question.id, question: {body: nil}
      }.not_to change { valid_question.reload}
    end
	end

	context 'questions#destroy' do
		it 'deletes question' do
			expect {
				delete :destroy, id: valid_question.id
			}.to change {Question.count}.by(-1)
		end
	end

end