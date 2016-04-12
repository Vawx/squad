class IssuesController < ApplicationController
  define_method :new do
    @profile_names = []
    @project = Project.find params[:project_id]
    @project.profiles. each do |p|
      @profile_names << p.user_name
    end
    @issue = Issue.new
  end

  define_method :create do
    youtube_links = ""
    imgur_links = ""
    params.each do |p|
      if p[0].include? "youtubes"
        youtube_links += "*" + p[1]
      elsif p[0].include? "imgurs"
        imgur_links += "*" + p[1]
      end
    end
    @project = Project.find(params[:project_id])
    @issue = @project.issues.new( issues_params )
    @issue.resources = youtube_links + "^" + imgur_links
    @issue.project_id = @project.id
    @issue.content = ( params[:content_bug].length > 0 ) ? params[:content_bug] : params[:content_task]
    @issue.status = "Open"
    if @issue.save
      redirect_to profile_project_path(current_user.profile, @project)
    else
      render :new
    end
  end

  private
  define_method :issues_params do
    params.require(:issue).permit( :issue_type, :profile_id, :severity )
  end
end
