require 'rails_helper'

describe SessionsController do
  let!(:user) {User.create(name: 'Antonio', email: 'antonio@gmail.com', password: '12345')}
  context 'sessions#new' do

    it 'returns a successful response' do
      get :new
      expect(response).to be_success
    end

    it 'renders the correct page' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'sessions#create' do
    it 'creates a new session with the correct user id' do
      expect {
        post :create, session: { email: 'antonio@gmail.com', password: '12345' }
      }.to change { session[:user_id] }.to(user.id)
    end

    it 'redirects to user show page if authenticated' do
      expect {
        post :create, session: { email: 'antonio@gmail.com', password: '12345' }
        }.to change { session[:user_id] }.to(user.id)
        expect(response).to be_redirect
    end
  end


  context 'sessions#delete' do
    it 'destroys the session by resetting the session' do
      session[:user_id] = 2
      expect {
        delete :destroy
      }.to change { session[:user_id] }.to(nil)
    end

    it 'response is a redirect' do
      session[:user_id] = 2
      expect {
        delete :destroy
      }.to change { session[:user_id] }.to(nil)
      expect(response).to be_redirect
    end
  end
end
