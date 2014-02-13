class VotesController < ApplicationController

before_action :authenticate_user!
before_action :find_idea

def vote_up

  Rails.logger.info(@idea.vote_score.class)
  Rails.logger.info( "?>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  @idea.vote_score += 1
  @idea.voters << current_user
  #current_user
  @idea.save

  redirect_to ideas_path, notice: "Voted Up"

end

def vote_down
  @idea.vote_score -= 1
  # @idea.vote_downs << current_user  
  @idea.save
  redirect_to ideas_path, notice: "Voted Down"

end

def vote_up_delete
    @idea.vote_ups.include?(current_user)
    @idea.vote_ups.delete(current_user)
    @idea.vote_score -= 1
    @idea.save
    redirect_to ideas_path, notice: "Up Vote withdrawn" 
end

def vote_down_delete
    @idea.vote_ups.include?(current_user)
    @idea.vote_downs.delete(current_user)
    @idea.vote_score += 1
    @idea.save
    redirect_to ideas_path, notice: "Down Vote withdrawn"
end

def find_idea
  @idea = Idea.find params[:idea_id]

end


end
