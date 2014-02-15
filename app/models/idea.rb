class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  has_many :participations
  has_many :participants, through: :participations, source: :user

  def update_vote_count
    Rails.logger.info("in Idea Model inside update vote count")
    self.vote_score = votes.up.count - votes.down.count
    self.save
    Rails.logger.info("in Idea Model inside update vote count #{self.vote_score}")
  end


  def participate_by user
    participants << user
  end

  def unparticipate_by user
    participants.delete(user)
  end
  
end
