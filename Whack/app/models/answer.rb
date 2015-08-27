class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
  validates :body, presence: true

  def vote_count
    self.votes.pluck(:votevalue).sum
  end

end
