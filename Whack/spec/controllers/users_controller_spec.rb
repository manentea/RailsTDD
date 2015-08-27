require 'rails_helper'

describe UsersController do
  let(:user) {User.create(name: 'Antonio', email: 'antonio@gmail.com', password_digest: '12345')}

  context 'users#index' do

    it 'returns a successful response' do
      get :index
      expect(response).to be_success
      #to be_success means the response is a 200 code
      expect(response).to render_template :index
    end

    it 'correctly assign instance variables' do
      get :index
      expect( assigns(:users) ).to eq( User.all )
    end

  end

  context 'users#show' do

    it 'return a successful response' do
      get :show, id: user.id
      expect(response).to be_success
    end

    it 'should assign the correct variable' do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template :show
    end
  end

  context 'users#new' do

    it 'returns a successful response' do
      get :new
      expect(response).to be_success
      expect(response).to render_template :new
    end

    it 'instantiates a new user' do
      new_user = User.new
      expect(new_user).to be_a_new User
    end

  end

  context 'users#create' do

    it 'creates a new user with valid attributes' do
      expect {
        post :create, user: {name: 'Antonio', email: 'antonio@gmail.com', password: '12345'}
      }.to change { User.count }.by(1)
    end

    it 'doesnt create a new user with invalid attributes' do
      expect {
        post :create, user: {name: 'ant'}
      }.not_to change { User.count }
      expect(response).not_to be_redirect
    end
  end

  context 'users#edit' do
    it 'return a successful response' do
      get :edit, id: user.id
      expect(response).to be_success
    end

    it 'should assign the correct variable' do
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template :edit
    end
  end

  context 'users#update' do
    it 'changes the correct attribute' do
      expect{
        patch :update, id: user.id, user: {name: 'Lauris'}
      }.to change { user.reload.name }.to("Lauris")
    end

    it 'doesnt change the attribute if it is invalid' do
      expect{
        patch :update, id: user.id, user: {name: nil}
      }.not_to change { user.reload}
    end
  end

  context 'users#destroy' do
    let!(:user1) {User.create(name: 'lauris', email: 'lauris@gmail.com', password_digest: 'asdgfasgerggas')}
    it 'deletes the user' do
      expect {
        delete :destroy, id: user1.id
      }.to change { User.count }.by(-1)
    end
  end

end
