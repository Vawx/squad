class AdminController < ApplicationController

  define_method :index do
    @project = Project.find(params[:project_id])
    @sending_error = ""
    @sending_message = ""
  end

  define_method :create do
    @project = Project.find(params[:project_id])
    @sending_error = ""
    @sending_message = ""
    email = params[:inviteAddress]
    if email.length > 0
      #create mail->send
      @sending_message = "Successfully invited: " + email
    else
      @sending_error = "To send an email, enter it into the field."
    end
    render :index
  end

end
