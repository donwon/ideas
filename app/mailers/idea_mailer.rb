class IdeaMailer < ActionMailer::Base
  
  default from: "do-not-reply@gmail.com"
  
    def notify_new_comment(comment)
      @comment   = comment
      @idea = comment.idea
      @user     = @idea.user
      mail(to: @user.email, subject: "New comment was posted to #{@idea.title}")
    end
end
