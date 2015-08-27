
class QuestionsController < ApplicationController


	def index
		@questions = Question.includes(:comments).most_popular
	end

	def show
		@question = Question.includes(:comments, :answers).find(params[:id])
		@question_answers = Answers.
	end

	def new
		@question = Question.new
	end

	def create
		h = question_params
		h[:user_id] = session[:user_id]
		@question = Question.new(h)
		if @question.save
			redirect_to @question
		else
			render :new
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		h = question_params
		h[:user_id] = session[:user_id]
		if @question.update_attributes(h)
			redirect_to @question
		else
			render :edit
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to root_url
	end



	private
		def question_params
			params.require(:question).permit(:title, :body)
		end

end
