class ParticipationsController < ApplicationController

def create
  idea = Idea.find(params[:idea_id])
  idea.participate_by(current_user)
  idea.save
  redirect_to ideas_path, notice: "Thanks for Joining Idea, you will be kept up to date via emails"

end

def destroy
  idea = Idea.find(params[:idea_id])
  idea.unparticipate_by(current_user)
  idea.save
  redirect_to ideas_path, notice: "You have un-subscribed"
  
end


end
