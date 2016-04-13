class IssuesController < ApplicationController
  define_method :new do
    @profile_names = []
    @project = Project.find params[:project_id]
    @project.profiles. each do |p|
      @profile_names << p.user_name
    end
    @issue = Issue.new
  end

  define_method :show do
    @project = Project.find params[:project_id]
    @issue = Issue.find params[:id]
  end

  define_method :update do
    @issue = Issue.find params[:id]
    if params[:commit] == "Transfer"
      @profile = Profile.find(params[:issue][:profile_id])
      @issue.profile_id = @profile.id
      if @issue.save
        redirect_to profile_project_path(current_user, Project.find(params[:project_id]), "success" + @profile.id.to_s)
        return
      end
    elsif params[:commit] == "Destroy"
      @issue.destroy
    else
      @issue.severity = params[:issue][:severity]
      @profile = Profile.find(params[:profile_id])

      if @issue.save
        redirect_to profile_project_path(current_user, Project.find(params[:project_id]))
        return
      end
    end
    redirect_to profile_project_path(current_user, Project.find(params[:project_id]))
  end

  define_method :edit do
    issue = Issue.find params[:id]
    project = Project.find(params[:project_id])
    if issue.status == "Open"
      issue.status = "Closed"
      issue.profile_id = project.admin_id
      redirect_to profile_project_path(current_user.profile, project)
    else
      issue.status = "Open"
      redirect_to profile_project_issue_path(current_user.profile, project, issue)
    end
    issue.save
  end

  define_method :create do
    youtube_links = ""
    imgur_links = ""
    params.each do |p|
      if p[0].include? "youtubes"
        youtube_links += "[+]" + p[1]
      elsif p[0].include? "imgurs"
        imgur_links += "[+]" + p[1]
      end
    end
    @project = Project.find(params[:project_id])
    @issue = @project.issues.new( issues_params )
    @issue.resources = youtube_links + "(+)" + imgur_links
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
