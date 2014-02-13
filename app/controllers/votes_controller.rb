class VotesController < ApplicationController

before_action :authenticate_user!

before_action :find_idea
before_action :find_vote, only: [:update,:destroy]

def create
  @vote = @idea.votes.new params.require(:vote).permit([:is_up])
  @vote.user == current_user
  if @vote.save
    redirect_to @idea, notice: "Vote recorded successfully!"
  else
    redirect_to @idea, notice: "Problem recording your vote"
  end
end

def update
  if @vote.update_attributes params.require(:vote).permit([:is_up])
    redirect_to @idea, notice: "Vote updated successfully!"
  else
    redirect_to @idea, notice: "Problem updating your vote"
  end
end

def destroy
  if @vote.destroy
    redirect_to @idea, notice: "Vote removed successfully!"
  else
    redirect_to @idea, notice: "Problem removing your vote"
  end
end

private

def find_vote
  @vote = current.user.votes.find params[:id]
end

def find_idea
  @idea = Idea.find params[:idea_id]
end


end
