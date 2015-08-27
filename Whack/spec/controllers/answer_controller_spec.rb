require 'rails_helper'
describe AnswersController do


  describe'GET#edit' do
    it "assigns the requested answer to @answer" do
    answer = create(:answer)
    get :edit, id: 1, question_id: 1
    expect(assigns(:answer)).to eq answer
  end

    it "renders the :edit template" do
    answer = create(:answer)
    get :edit, id: 1, question_id: 1
    expect(response).to render_template :edit
    end
  end


end
