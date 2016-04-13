class CommentsController < ApplicationController

  define_method :new do
    @comment = Comment.new
    @project = Project.find params[:project_id]
    @issue = Issue.find params[:issue_id]
  end

  define_method :create do
    @project = Project.find params[:project_id]
    @issue = Issue.find params[:issue_id]
    @comment = @issue.comments.new(comment_params)
    @comment.issue_id = @issue.id
    @comment.author_id = current_user.profile.id
    if @comment.save
      redirect_to profile_project_issue_path(current_user.profile, @project, @issue)
    else
      render :new
    end
  end

  private
  define_method :comment_params do
    params.require(:comment).permit(:content)
  end
end
