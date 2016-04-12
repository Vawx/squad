class IssuesController < ApplicationController
  define_method :new do
    @profile_names = []
    @project = Project.find params[:project_id]
    @project.profiles. each do |p|
      @profile_names << p.user_name
    end
    @issue = Issue.new
  end
end
