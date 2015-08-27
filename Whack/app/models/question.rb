class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
  validates :body, presence: true
  validates :title, presence: true

  def vote_count
    self.votes.pluck(:votevalue).sum
  end

  def self.most_popular
    Question.all.sort_by {|q| q.vote_count}.reverse
  end

  def sorted_answers
    self.answers.sort_by {|question| question.vote_count}.reverse
  end

end
