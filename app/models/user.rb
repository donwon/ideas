class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :ideas
  has_many :comments
  has_many :votes

  has_many :participations
  has_many :participated_ideas, through: :participations, source: :idea

  def vote_for_this idea
    #returns an array of all the data that where the idea and user match
    Vote.where(idea: idea, user: self).first

  end

  def follow_this idea
     likes.where(idea_id: idea.id).first
  end
 
  def has_followed? idea
     participated_ideas.include? idea
  end




end
