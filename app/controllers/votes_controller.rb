class VotesController < ApplicationController

before_action :authenticate_user!

before_action :find_idea
before_action :find_vote, only: [:update,:destroy]

def vote_up
  @vote = @idea.votes.new #params.require(:vote).permit([:is_up])
  @vote.user = current_user
  @vote.is_up = true
  if @vote.save
    redirect_to ideas_path, notice: "up Vote recorded successfully!"
  else
    redirect_to ideas_path, notice: "Problem recording your up vote"
  end
end

def vote_down
  @vote = @idea.votes.new #params.require(:vote).permit([:is_up])
  @vote.user = current_user
  @vote.is_up = false
  if @vote.save
    redirect_to ideas_path, notice: "down Vote recorded successfully!"
  else
    redirect_to ideas_path, notice: "Problem recording your down vote"
  end
end

# def update
#   if @vote.update_attributes params.require(:vote).permit([:is_up])
#     redirect_to ideas_path, notice: "Vote updated successfully!"
#   else
#     redirect_to ideas_path, notice: "Problem updating your vote"
#   end
# end

def destroy
  if @vote.destroy
    redirect_to ideas_path, notice: "Vote removed successfully!"
  else
    redirect_to ideas_path, notice: "Problem removing your vote"
  end
end

private

def find_vote
  @vote = current_user.votes.find params[:id]
end

def find_idea
  @idea = Idea.find params[:idea_id]
end


end
