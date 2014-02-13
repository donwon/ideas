class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  def update_vote_count
    self.vote_score = votes.up.count - votes.down.count
  end
  
end
