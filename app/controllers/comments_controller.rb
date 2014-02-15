class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @idea = Idea.find(params[:idea_id])  
    #@comment.idea = Idea.find(params[:idea_id])
    #@comment.user = current_user

  end

  def create
    @idea = Idea.find(params[:idea_id])  
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.idea = Idea.find(params[:idea_id])
    @comment.user = current_user
    if @comment.save
    IdeaMailer.notify_new_comment(@comment).deliver
    redirect_to @idea, notice: "Thanks for your comment"
    else
    redirect_to @idea, alert: "Problem saving your comment"
    end


  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @idea, notice: "Comment was deleleted"

  end

end
