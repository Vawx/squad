class PendingInviteController < ApplicationController
  define_method :index do
    @pending = PendingInvite.all.where( invite_email: current_user.email )
  end

  define_method :edit do
    pending_project = Project.find(PendingInvite.find(params[:id]).project_id)
    if params[:format] == "join"
      current_user.profile.projects << pending_project
    end
    redirect_to profile_project_path(current_user, pending_project)
  end

  define_method :destroy do
    ignored_project_invite = PendingInvite.find(params[:id])
    ignored_project_invite.destroy
    ignored_project_invite.save
    redirect_to root_path
  end
end
