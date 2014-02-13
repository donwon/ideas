class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :ideas
  has_many :comments
  has_many :votes

  def vote_for_this idea
    #returns an array of all the data that where the idea and user match
    Vote.where(idea: idea, user: self).first

  end






end
