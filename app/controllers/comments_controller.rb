class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @idea = Idea.find(params[:idea_id])  
    @comment.idea = Idea.find(params[:idea_id])
    @comment.user = current_user

    @comment.save


  end

  def create
    @idea = Idea.find(params[:idea_id])  
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.idea = Idea.find(params[:idea_id])
    @comment.user = current_user

    @comment.save
    redirect_to @idea, notice: "Thanks for your comment"

  end


end
