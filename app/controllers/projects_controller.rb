class ProjectsController < ApplicationController
  define_method :index do
    @projects = current_user.profile.projects
    if @projects.length == 0
      redirect_to new_profile_project_path current_user
    end
  end

  define_method :show do
    @project = Project.find params[:id]
    @my_issues = @project.issues.where(profile_id: current_user.profile.id)
    @my_issues = ApplicationHelper::sort_issues_by_severity(@my_issues)

    if params[:format].class != NilClass
      profile_id = params[:format]
      if profile_id.include? "success"
        profile_id = profile_id.sub("success", "")
        flash.now[:notice] = "Successfully sent issue to: " + Profile.find(profile_id).user_name
      end
    end

  end

  define_method :new do
    @project = Project.new
  end

  define_method :create do
    @project = current_user.profile.projects.new project_params
    @project.admin_id = current_user.id
    if @project.save
      current_user.profile.projects.push @project
      current_user.profile.save
      redirect_to profile_project_path( current_user, @project )
    else

    end
  end

  private
  define_method :project_params do
    params.require(:project).permit(:name, :admin_id)
  end
end
